function EditMyProfile() {

	const myinfo_API_BASE_URL = "http://localhost:8080/tofu/info/employee/";
	const EMP_API_BASE_URL = "http://localhost:8080/tofu/employee/";

	const [myinfo, setMyinfo] = React.useState([]);

	React.useEffect(() => {
		const getLoggedinInfo = async () => {
			const { data: myinfo } = await axios.get(EMP_API_BASE_URL + "leave/my_info");
			setMyinfo(myinfo);
		};
		getLoggedinInfo();
	}, []);

	const [image, setImage] = React.useState(null);
	const imageInputRef = React.useRef(null);
	const [changed, setChanged] = React.useState(false);

	const handleImageChange = (e) => {
		setChanged(true);
		const uploadImage = e.target.files[0];
		setImage(URL.createObjectURL(uploadImage));

		const reader = new FileReader();
		reader.readAsDataURL(uploadImage);
		reader.onloadend = () => {
			const base64String = reader.result.replace("data:", "").replace(/^.+,/, "");
			modifiedUserInfo[e.target.name] = base64String;
		};
		console.log(uploadImage);
		console.log(JSON.stringify(modifiedUserInfo));
	};

	let modifiedUserInfo = myinfo
	const updateUser = async (e) => {
		e.preventDefault();
		let filteredUser = Object.fromEntries(
			Object.entries(modifiedUserInfo).filter(([key, value]) => key !== "age")
		);
		filteredUser = Object.fromEntries(
			Object.entries(modifiedUserInfo).filter(([key, value]) => key !== "checks")
		);
		const response = await fetch(EMP_API_BASE_URL + "edit/" + myinfo.eid, {
			method: "PUT",
			headers: {
				"Content-Type": "application/json",
			},
			body: JSON.stringify(filteredUser),
		});
		if (!response.ok) {
			console.log(JSON.stringify(filteredUser));
			throw new Error("Something went wrong");
		}
		const _myinfo = await response.json();
		window.location.href = "http://localhost:8080/tofu/employee/edit_my_profile";
	};
	
	const handleChange = (event) => {
		const value = event.target.value;
		modifiedUserInfo[event.target.name] = value
	};



	return (
		<>
			<div className="container mx-auto px-14 py-16 flex justify-between">
				<Sidebar />
				<div className="flex-wrap justify-center w-full w-4/5">
					<div className="flex justify-between">
						<p className="text-2xl my-6">修改個人資料</p>
					</div>
					<div className="overflow-x-auto">

						<div className="container mx-auto flex justify-center">
							<form>
								<div className="space-y-12">
									<div className="border-b border-gray-900/10 pb-12" hidden></div>
									<p className="mt-1 text-sm leading-6 text-gray-600" hidden>
										This information will be displayed publicly so be careful what
										you share.
									</p>

									<div className="mt-10 grid grid-cols-1 gap-x-6 gap-y-8 sm:grid-cols-5">
										<div className="mt-10 grid col-span-3">
											<div className="sm:col-span-2 mr-6" hidden>
												<label
													htmlFor="eid"
													className="block text-sm font-medium leading-6 text-gray-900"
												>
													ID
												</label>
												<div className="mt-2">
													<input
														type="text"
														name="eid"
														id="eid"
														autoComplete="eid"
														defaultValue={myinfo.eid}
														onChange={(e) => handleChange(e)}
														className="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
													/>
												</div>
											</div>

											<div className="sm:col-span-2 mr-6">
												<label
													htmlFor="firstName"
													className="block text-sm font-medium leading-6 text-gray-900"
												>
													First name
												</label>
												<div className="mt-2">
													<input
														disabled="true"
														type="text"
														name="firstName"
														id="firstName"
														defaultValue={myinfo.firstName}
														key={myinfo.firstName}
														onChange={(e) => handleChange(e)}
														autoComplete="firstName"
														className="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
													/>
												</div>
											</div>

											<div className="sm:col-span-2">
												<label
													htmlFor="lastName"
													className="block text-sm font-medium leading-6 text-gray-900"
												>
													Last name
												</label>
												<div className="mt-2">
													<input
														disabled="true"
														type="text"
														name="lastName"
														id="lastName"
														defaultValue={myinfo.lastName}
														key={myinfo.lastName}
														onChange={(e) => handleChange(e)}
														autoComplete="lastName"
														className="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
													/>
												</div>
											</div>

											<div className="mt-6 sm:col-span-2 mr-6">
												<label
													htmlFor="account"
													className="block text-sm font-medium leading-6 text-gray-900"
												>
													Account
												</label>
												<div className="mt-2">
													<input
														disabled="true"
														type="text"
														name="account"
														id="account"
														defaultValue={myinfo.account}
														key={myinfo.account}
														onChange={(e) => handleChange(e)}
														autoComplete="account"
														className="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
													/>
												</div>
											</div>

											<div className="mt-6 sm:col-span-2">
												<label
													htmlFor="password"
													className="block text-sm font-medium leading-6 text-gray-900"
												>
													Password
												</label>
												<div className="mt-2">
													<input
														type="password"
														name="password"
														id="password"
														defaultValue={myinfo.password}
														key={myinfo.password}
														onChange={(e) => handleChange(e)}
														autoComplete="password"
														className="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
													/>
												</div>
											</div>



											<div className="col-span-4 mt-6">
												<label
													htmlFor="email"
													className="block text-sm font-medium leading-6 text-gray-900"
												>
													Email address
												</label>
												<div className="mt-2">
													<input
														id="email"
														name="email"
														type="email"
														autoComplete="email"
														defaultValue={myinfo.email}
														key={myinfo.email}
														onChange={(e) => handleChange(e)}
														className="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
													/>
												</div>
											</div>

										</div>

										<div className="mt-10 grid col-span-2">
											<label
												htmlFor="photoChange"
												className="block text-sm font-medium leading-6 text-gray-900"
											>
												Photo
											</label>
											<div className="mt-2 flex-wrap justify-center items-center gap-x-3 w-56">

												{changed === false ? (<img src={"http://localhost:8080/tofu/employee/getEmployeePhoto/" + myinfo.eid}></img>) : (<img src={image}></img>)}

												<button
													id="photoChange"
													type="button"
													onClick={() => imageInputRef.current.click()}
													className="rounded-md bg-white px-2.5 py-1.5 text-sm font-semibold text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 hover:bg-gray-50"
												>
													Change
												</button>
												<label htmlFor="photo" style={{ display: 'none' }}>
													<input
														id="photo"
														name="photo"
														type="file"
														ref={imageInputRef}
														key={myinfo.photo}
														onChange={(e) => handleImageChange(e)}
													/>
												</label>
											</div>
										</div>

										<div className="col-span-2">
											<label
												htmlFor="birthday"
												className="block text-sm font-medium leading-6 text-gray-900"
											>
												Birthday
											</label>
											<div className="mt-2">
												<input
													id="birthday"
													name="birthday"
													type="date"
													autoComplete="birthday"
													defaultValue={myinfo.birthday}
													key={myinfo.birthday}
													onChange={(e) => handleChange(e)}
													className="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
												/>
											</div>
										</div>

										<div className="sm:col-span-2">
											<label
												htmlFor="phone"
												className="block text-sm font-medium leading-6 text-gray-900"
											>
												Phone Number
											</label>
											<div className="mt-2">
												<input
													id="phone"
													name="phone"
													type="text"
													defaultValue={myinfo.phone}
													key={myinfo.phone}
													onChange={(e) => handleChange(e)}
													autoComplete="phone"
													className="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
												/>
											</div>
										</div>

										<div className="col-span-4 flex-wrap">
											<fieldset>
												<legend

													className="block text-sm font-medium leading-6 text-gray-900"
												>
													Gender
												</legend>
												<div className="mt-4">
													<div className="mr-10 inline-flex items-center gap-x-3 inline-block">
														<input
															id="male"
															name="gender"
															type="radio"
															value="Male"
															defaultChecked={myinfo.gender === "Male"}
															key={myinfo.gender === "Male"}
															onChange={(e) => handleChange(e)}
															className="h-4 w-4 border-gray-300 text-indigo-600 focus:ring-indigo-600"
														/>
														<label
															htmlFor="male"
															className="inline-block text-sm font-medium leading-6 text-gray-900"
														>
															Male
														</label>
													</div>

													<div className="mr-10 inline-flex items-center gap-x-3 inline-block">
														<input
															id="female"
															name="gender"
															type="radio"
															value="Female"
															defaultChecked={myinfo.gender === "Female"}
															key={myinfo.gender === "Female"}
															onChange={(e) => handleChange(e)}
															className="h-4 w-4 border-gray-300 text-indigo-600 focus:ring-indigo-600"
														/>
														<label
															htmlFor="female"
															className="inline-block text-sm font-medium leading-6 text-gray-900"
														>
															Female
														</label>
													</div>
													<div className="inline-flex items-center gap-x-3 inline-block">
														<input
															id="not-disclosed"
															name="gender"
															type="radio"
															value="Not-disclosed"
															defaultChecked={myinfo.gender === "Not-disclosed"}
															key={myinfo.gender === "Not-disclosed"}
															onChange={(e) => handleChange(e)}
															className="h-4 w-4 border-gray-300 text-indigo-600 focus:ring-indigo-600"
														/>
														<label
															htmlFor="not-disclosed"
															className="inline-block text-sm font-medium leading-6 text-gray-900"
														>
															Do not wish to disclose
														</label>
													</div>
												</div>
											</fieldset>
										</div>


									</div>

									<div className="mt-10 grid grid-cols-1 gap-x-6 gap-y-8 sm:grid-cols-6">
										<div className="modal-action mr-16 justify-end">
											<a href="#" onClick={updateUser} className="btn btn-primary">
												Save
											</a>
										</div>
									</div>
								</div>


							</form>

							<div className="border-b border-gray-900/10 pb-12"></div>
						</div>
					</div>
				</div>
			</div>
		</>

	);
}
