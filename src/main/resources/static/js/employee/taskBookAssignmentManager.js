function TaskBookAssignmentManager() {

	const EMP_API_BASE_URL = "http://localhost:8080/tofu/employee/";
	const [waitforassign, setWaitforassign] = React.useState([]);
	const [bookdata, setBookdata] = React.useState([]);
	const [elist, setElist] = React.useState([]);
	const [clist, setClist] = React.useState([]);
	const [plist, setPlist] = React.useState([]);

    const maintenanceApiEndPoint = "http://localhost:8080/tofu/employee/task/booklist";
    const avalibleEmployeeByMidApiEndPoint = "http://localhost:8080/tofu/employee/task/available_emplist/book/";
    const employeeApiEndPoint = "http://localhost:8080/tofu/employee/allJson";

    const [books, setBooks ] = React.useState([]);
    const [employees, setEmployees ] = React.useState([]);
	const [selectedValue, setSelectedValue] = React.useState("default");

    React.useEffect(() => {
        const getBooks = async () => {
            const { data: res } = await axios.get(EMP_API_BASE_URL + "task/booklist");
            const res1 =  res.map(async (element) => {
            const { data: avalibleListOfElement } = await axios.get(avalibleEmployeeByMidApiEndPoint + element.book_id)
            const avalibleListOfElementAccount = avalibleListOfElement.map(({eid, account})=>({eid, account}))
            const avalibleListOfElementEid = avalibleListOfElement.map(ele=>ele.eid)
            return({
            ...element,
            avalibleList: avalibleListOfElementAccount,
            })});
            const res2 = await Promise.all(res1)
            setBooks(res2)

            const { data: tempEmployeesInfo } = await axios.get(employeeApiEndPoint);
            setEmployees(tempEmployeesInfo)
        };
        getBooks();
    }, []);

      const handleChange = async (ele) => {
        setSelectedValue("default");
        await axios.put('http://localhost:8080/tofu/employee/task/management_book/' + ele.book_id,
        { "eid": event.target.value });
        const { data: res } = await axios.get(EMP_API_BASE_URL + "task/booklist");
        const res1 =  res.map(async (element) => {
        const { data: avalibleListOfElement } = await axios.get(avalibleEmployeeByMidApiEndPoint + element.book_id)
        const avalibleListOfElementAccount = avalibleListOfElement.map(({eid, account})=>({eid, account}))
        const avalibleListOfElementEid = avalibleListOfElement.map(ele=>ele.eid)
        return({
        ...element,
        avalibleList: avalibleListOfElementAccount,
        })});
        const res2 = await Promise.all(res1)
        setBooks(res2)
      };

        const getAccountByEid = (id)=>{
          const employee = employees.find((emp)=>{
            return(emp.eid===id)
          })
          return employee ? employee.account : ''
        }

        let booksTbody = books.map((ele) => {
          return (<tr className="hover" key={ele.book_id}>
            <td>{ele.book_id}</td>
            <td>{getTheProductName(ele.f_product_id)}</td>
            <td>{getTheCusName(ele.f_customer_id)}</td>
            <td>{ele.book_date}</td>
            <td>{getTheEmpName(ele.f_employee_id)}</td>
            <td>
              <select disabled={ele.status === 'closed' ? true : false}
                onChange={() => handleChange(ele)}
                className="select select-bordered w-full max-w-xs"
                value={selectedValue}
              >
                <option value="default" disabled selected>
                  {ele.status !== 'closed' ? ele.status !== 'assigned' ? "assign" : "modify" : "closed"}
                </option>
                  {ele.avalibleList.map((ele_ele)=> <option value={ele_ele.eid} key={ele_ele.eid}>{ele_ele.account}</option> )}
              </select>
            </td>
          </tr>)
        })

	React.useEffect(() => {
		const getTasksNumber = async () => {
			const { data: countWaitingAssign } = await axios.get(EMP_API_BASE_URL + "task/waiting_assign");
			setWaitforassign(countWaitingAssign);
		};
		getTasksNumber();
	}, []);

	React.useEffect(() => {
		const getWaitingBooks = async () => {
			const { data: booklist } = await axios.get(EMP_API_BASE_URL + "task/booklist");
			setBookdata(booklist.reverse());
		};
		getWaitingBooks();
	}, []);

	React.useEffect(() => {
		const getEmpList = async () => {
			const { data: emplist } = await axios.get(EMP_API_BASE_URL + "allJson");
			setElist(emplist);
		};
		getEmpList();
	}, []);

	function getTheEmpName(eid) {
		let namelist = [];
		{ elist.map((emp) => (namelist.push(emp.firstName + " " + emp.lastName))) };
		let arraynumber = eid - 1;
		let name = namelist[arraynumber];
		return name;
	}

	React.useEffect(() => {
		const getCusList = async () => {
			const { data: cuslist } = await axios.get(EMP_API_BASE_URL + "task/customerlist");
			setClist(cuslist);
		};
		getCusList();
	}, []);

	function getTheCusName(cid) {
		let namelist = [];
		{ clist.map((cus) => (namelist.push(cus.name))) };
		let arraynumber = cid - 1;
		let name = namelist[arraynumber];
		return name;
	}
	
	React.useEffect(() => {
		const getProductList = async () => {
			const { data: productlist } = await axios.get(EMP_API_BASE_URL + "task/productlist");
			setPlist(productlist);
		};
		getProductList();
	}, []);

	function getTheProductName(pid) {
		let namelist = [];
		{ plist.map((product) => (namelist.push(product.productModel))) };
		let arraynumber = pid - 1;
		let name = namelist[arraynumber];
		return name;
	}
	


	return (
		<>
			<div className="container mx-auto px-14 py-16 flex justify-between">
				<Sidebar targetData={books}/>
				<div className="flex-wrap justify-center w-full w-4/5">
					<div className="flex justify-between">
						<p className="text-2xl my-6">目前共有 {books.filter((ele)=>ele.status==='waiting').length} 件預約賞車任務待分派</p>
					</div>
					<div className="overflow-x-auto flex">
						<table className="table w-full w-4/5">
							<thead>
								<tr>
									<th>ID</th>
									<th>Product</th>
									<th>Customer</th>
									<th>Reservation Time</th>
									<th>Employee</th>
									<th>Assign</th>
								</tr>
							</thead>
							<tbody>
								{booksTbody}
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</>

	);
}
