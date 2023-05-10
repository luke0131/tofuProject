function Home() {

  const [data, setData] = React.useState([]);
  const [currentUserInfo, setCurrentUserInfo] = React.useState([]);
  const [showModal, setShowModal] = React.useState(false);
  const tableRowRemove = (index) => {
    axios
      .delete("http://localhost:8080/tofu/employee/delete/" + index)
      .then((response) => {
        console.log(response);
      })
      .catch((error) => {
        console.log(error);
      });

    let dataRows = [...data]; 
    dataRows = dataRows.filter((dataRow) => dataRow.eid !== index); 
    setData(dataRows);
  };
  React.useEffect(() => {
    axios
      .get("http://localhost:8080/tofu/employee/allJson")
      .then((response) => {
        setData(response.data);
      })
      .catch((error) => {
        console.log(error);
      });
  }, []);

  React.useEffect(() => {
    document.querySelector("html").setAttribute("data-theme", "emerald");
  }, []);

  let dta = data.map((employee) => {
    return (
      <tr className="hover" key={employee.eid}>
        <td>{employee.eid}</td>
        <td>
          <img
            className="empPhoto object-scale-down"
            src={
              "http://localhost:8080/tofu/employee/getEmployeePhoto/" +
              employee.eid
            }
          />
        </td>
        <td>
          {employee.firstName} {employee.lastName}
        </td>
        <td>{getAge(employee.birthday)}</td>
        <td>{employee.department}</td>
        <td>{employee.position}</td>
        <td>{employee.hireDate}</td>
        <td>{employee.email}</td>
        <td>
          <a href="#my-modal">
            <button
              className="btn btn-outline btn-secondary btn-xs"
              id={"e" + employee.eid}
              onClick={(e) => {
                setCurrentUserInfo(data.filter((user)=>user.eid===employee.eid));
                setShowModal(true)}}
            >
              <i className="fas fa-user-edit"></i>
            </button>
          </a>
        </td>
        <td>
          <button
            className="btn btn-outline btn-error btn-xs"
            onClick={() => tableRowRemove(employee.eid)}
            id={"d" + employee.eid}
          >
            <i className="fas fa-trash-alt"></i>
          </button>
        </td>
      </tr>
    );
  });

  return (
    <>
      <div className="container mx-auto px-14 py-16 flex justify-between">
        <Sidebar />
        <div className="flex-wrap justify-center w-full w-4/5">
          <div className="w-4/5">
            <p className="text-2xl my-6">Employee List</p>
          </div>
          <div className="overflow-x-auto flex justify-center">
            <table className="table w-4/5">
              <thead className="text-left">
                <tr>
                  <th>ID</th>
                  <th>Photo</th>
                  <th>Name</th>
                  <th>Age</th>
                  <th>Department</th>
                  <th>Position</th>
                  <th>Hire Date</th>
                  <th>Email</th>
                  <th>Edit</th>
                  <th>Delete</th>
                </tr>
              </thead>
              <tbody>{dta}</tbody>
            </table>
          </div>
        </div>
      </div>
      { showModal ? <EditEmployee userInfo={currentUserInfo} /> : null }
    </>
  );

  function getAge(birthday) {
    const today = new Date();
    const birthDate = new Date(birthday);
    let age = today.getFullYear() - birthDate.getFullYear();
    const month = today.getMonth() - birthDate.getMonth();
    if (month < 0 || (month === 0 && today.getDate() < birthDate.getDate())) {
      age--;
    }
    return age;
  }
}
