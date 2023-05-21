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
		if (clist.length === 0) return ''
		const customer = clist.find((cus) => {
			return (cus.customer_id === cid);
		});
		return (customer.name);
	}

	function getTheCusPhone(cid) {
		if (clist.length === 0) return ''
		const customer = clist.find((cus) => {
			return (cus.customer_id === cid);
		});
		return (customer.phone);
	}
	
	function getTheCusEmail(cid) {
		if (clist.length === 0) return ''
		const customer = clist.find((cus) => {
			return (cus.customer_id === cid);
		});
		return (customer.email);
	}

	React.useEffect(() => {
		const getProductList = async () => {
			const { data: productlist } = await axios.get(EMP_API_BASE_URL + "task/productlist");
			setPlist(productlist);
		};
		getProductList();
	}, []);

	function getTheProductName(pid) {
		if (plist.length === 0) return ''
		const product = plist.find((pro) => {
			return (pro.productId === pid.productId);
		});
		return (product.productModel);
	}

	const handleComplete = async (post) => {
		await axios.put(EMP_API_BASE_URL + "task/management_mtn/finished/" + post.mid);

		const { data: mtnlist } = await axios.get(EMP_API_BASE_URL + "task/mtn_todolist"); //用了await，所在的函式就要用async
		setMtndata(mtnlist.reverse());
	};

	return (
		<>
			<div className="container mx-auto px-14 py-16 flex justify-between">
				<Sidebar targetData={mtndata} />
				<div className="flex-wrap justify-center w-full w-4/5">
					<div className="flex justify-between">
						<p className="text-2xl my-6">目前共有 {mtndata.length} 件預約保養任務待完成</p>
					</div>
					<div className="overflow-x-auto flex">
						<table className="table w-full w-4/5">
							<thead>
								<tr>
									<th>ID</th>
									<th>Maintenance Category</th>
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
										<td> {amtn.pid ? (<img className="inline-block object-scale-down w-12 mr-2" src={"http://localhost:8080/tofu/employee/task/getProductPhoto/" + amtn.pid.productId} />) : null } {amtn.pid ? getTheProductName(amtn.pid) : ''} </td>
										<td> {amtn.cid ? getTheCusName(amtn.cid) : ''} {amtn.cid ? (
											<div className="dropdown dropdown-top dropdown-hover">
												<label tabIndex={0}><svg xmlns="http://www.w3.org/2000/svg" className="w-3 h-3 mx-2" viewBox="0 0 24 24" fill="gray" stroke="gray" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><g fill="none" fill-rule="evenodd"><path d="M18 14v5a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V8c0-1.1.9-2 2-2h5M15 3h6v6M10 14L20.2 3.8" /></g></svg></label>
												<div tabIndex={0} className="dropdown-content p-2 shadow bg-sky-50 rounded-box h-24 flex items-center pr-8"><div className="avatar">
													<div className="w-16 rounded-full mx-4"><img src={"http://localhost:8080/tofu/downloadPhoto/" + amtn.cid} /></div></div>
													<div>
														<strong className="block text-lg">{amtn.cid ? getTheCusName(amtn.cid) : ''}</strong>
														<span className="block text-slate-400 text-sm mt-1">{amtn.cid ? getTheCusPhone(amtn.cid) : ''}</span>
														<span className="block text-slate-400 text-sm">{amtn.cid ? getTheCusEmail(amtn.cid) : ''}</span>
													</div></div>
											</div>) : null}</td>
										<td> {amtn.appointment === null ? "" : amtn.appointment.substring(0, 10)} {amtn.appointmenttime}</td>
										<td>
											<button onClick={() => handleComplete(amtn)} className="btn btn-outline">
												Completed
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
