function TaskMtnAssignmentEmployee() {
	
	const EMP_API_BASE_URL = "http://localhost:8080/tofu/employee/";
	const [waittodo, setWaittodo] = React.useState([]);
	const [mtndata, setMtndata] = React.useState([]);
	const [elist, setElist] = React.useState([]);
	const [clist, setClist] = React.useState([]);
	const [plist, setPlist] = React.useState([]);
	
	React.useEffect(() => {
		const getTasksNumber = async () => {
			const { data: countWaitingTodo } = await axios.get(EMP_API_BASE_URL + "task/waiting_todo");
			setWaittodo(countWaitingTodo);	
		};
		getTasksNumber();
	}, []);
	
	React.useEffect(() => {
		const getWaitingMtns = async () => {
			const { data: mtnlist } = await axios.get(EMP_API_BASE_URL + "task/mtn_todolist"); //用了await，所在的函式就要用async
			setMtndata(mtnlist.reverse());
		};
		getWaitingMtns();
	}, []);


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
	
	

	const handleComplete = async (post) => {
		await axios.put(EMP_API_BASE_URL + "task/management_mtn/finished/" + post.mid);

        const { data: mtnlist } = await axios.get(EMP_API_BASE_URL + "task/mtn_todolist"); //用了await，所在的函式就要用async
        setMtndata(mtnlist.reverse());
	};

	return (
		<>
			<div className="container mx-auto px-14 py-16 flex justify-between">
				<Sidebar targetData={mtndata}/>
				<div className="flex-wrap justify-center w-full w-4/5">
					<div className="flex justify-between">
						<p className="text-2xl my-6">目前共有 {mtndata.length} 件預約保養任務待完成</p>
					</div>
					<div className="overflow-x-auto flex">
						<table className="table w-full w-4/5">
							<thead>
								<tr>
									<th>ID</th>
									<th>Maintenance and Repair Category</th>
									<th>Product</th>
									<th>Customer</th>
									<th>Reservation Time</th>
									<th>Update</th>
								</tr>
							</thead>
							<tbody>
								{mtndata.map((amtn) => (
									<tr key={amtn.mid}>
										<td> {amtn.mid} </td>
										<td> {amtn.mcategory} </td>
										<td> {getTheProductName(amtn.pid)} </td>
										<td> {getTheCusName(amtn.cid)} </td>
										<td> {amtn.appointment.substring(0, 10)} {amtn.appointmenttime}</td>
										<td>
											<button onClick={() => handleComplete(amtn)} className="btn">
												Update
											</button>
										</td>
									</tr>
								))}
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</>
	);
}
