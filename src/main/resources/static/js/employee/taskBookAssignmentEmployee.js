function TaskBookAssignmentEmployee() {
	
	const EMP_API_BASE_URL = "http://localhost:8080/tofu/employee/";
	const [waittodo, setWaittodo] = React.useState([]);
	const [bookdata, setBookdata] = React.useState([]);
	const [elist, setElist] = React.useState([]);
	const [clist, setClist] = React.useState([]);
	const [plist, setPlist] = React.useState([]);
	
	React.useEffect(() => {
		const getTasksNumber = async () => {
			const { data: countWaitingTodo } = await axios.get(EMP_API_BASE_URL + "task/waiting_todo");
			//console.log(countWaitingAssign.waitingTotal);
			setWaittodo(countWaitingTodo);	
		};
		getTasksNumber();
	}, []);
	
	React.useEffect(() => {
		const getWaitingBooks = async () => {
			const { data: booklist } = await axios.get(EMP_API_BASE_URL + "task/book_todolist"); 
			setBookdata(booklist.reverse());
		};
		getWaitingBooks();
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
		await axios.put(EMP_API_BASE_URL + "task/management_book/finished/" + post.book_id);

        const { data: booklist } = await axios.get(EMP_API_BASE_URL + "task/book_todolist");
        setBookdata(booklist.reverse());
	};

	return (
		<>
			<div className="container mx-auto px-14 py-16 flex justify-between">
				<Sidebar targetData={bookdata}/>
				<div className="flex-wrap justify-center w-full w-4/5">
					<div className="flex justify-between">
						<p className="text-2xl my-6">目前共有 {bookdata.length} 件預約賞車任務待完成</p>
					</div>
					<div className="overflow-x-auto flex">
						<table className="table w-full w-4/5">
							<thead>
								<tr>
									<th>ID</th>
									<th>Product</th>
									<th>Customer</th>
									<th>Reservation Time</th>
									<th>Update</th>
								</tr>
							</thead>
							<tbody>
								{bookdata.map((book) => (
									<tr key={book.book_id}>
										<td> {book.book_id} </td>
										<td> {getTheProductName(book.f_product_id)} </td>
										<td> {getTheCusName(book.f_customer_id)} </td>
										<td> {book.book_date}</td>
										<td>
											<button onClick={() => handleComplete(book)} className="btn">
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
