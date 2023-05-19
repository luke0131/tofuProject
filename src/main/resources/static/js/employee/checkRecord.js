function CheckRecord() {
	const [posts, setPosts] = React.useState([]);
	const [todos, setTodos] = React.useState([]);
	const [selectedValue, setSelectedValue] = React.useState("default");
	const apiEndPoint = "https://jsonplaceholder.typicode.com/posts";
	const todosApiEndPoint = "https://jsonplaceholder.typicode.com/todos";
	const usersApiEndPoint = "https://jsonplaceholder.typicode.com/users";

	const EMP_API_BASE_URL = "http://localhost:8080/tofu/employee/";
	const [checkdata, setCheckdata] = React.useState([]);
	const [elist, setElist] = React.useState([]);

	React.useEffect(() => {
		const getCheckList = async () => {
			const { data: checklist } = await axios.get(EMP_API_BASE_URL + "checkrecord");
			setCheckdata(checklist.reverse());
		};
		getCheckList();
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
		const getTodos = async () => {
			const { data: res } = await axios.get(todosApiEndPoint); //用了await，所在的函式就要用async
			setTodos(res);
		};
		getTodos();
	}, []);
	const handleChange = async (todo) => {
		setSelectedValue("default");

		todo.userId = event.target.value;
		await axios.put(todosApiEndPoint + "/" + todo.id);

		const todosClone = [...todos];
		const index = todosClone.indexOf(todo);
		todosClone[index] = { ...todo };
		setTodos(todosClone);
	};

	return (
		<>
			<div className="container mx-auto px-14 py-16 flex justify-between">
				<Sidebar />
				<div className="flex-wrap justify-center w-full w-4/5">
					<div className="flex justify-between">
						<p className="text-2xl my-6">員工出勤紀錄</p>
					</div>
					<div className="overflow-x-auto flex">
						<table className="table w-full w-4/5">
							<thead>
								<tr>
									<th>ID</th>
									<th>Employee ID</th>
									<th>Employee</th>
									<th>Date</th>
									<th>Check In</th>
									<th>Check Out</th>
								</tr>
							</thead>
							<tbody>
								{checkdata.map((check) => (
									<tr key={check.cid}>
										<td> {check.cid}</td>
										<td> {check.eid}</td>
										<td> {check.firstName} {check.lastName}</td>
										<td> {check.checks.checkInTime === null ? "" : check.checks.checkInTime.substring(0, 10)}</td>
										<td> {check.checks.checkInTime === null ? "" : check.checks.checkInTime.substring(11)}</td>
										<td> {check.checks.checkOutTime === null ? "" : check.checks.checkOutTime.substring(11)} </td>
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
