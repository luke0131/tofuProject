function MainPage() {

	const myinfo_API_BASE_URL = "http://localhost:8080/tofu/info/employee/";
	const EMP_API_BASE_URL = "http://localhost:8080/tofu/employee/";

	const [myinfo, setMyinfo] = React.useState([]);
	const [salesdata, setSalesData] = React.useState([]);

	React.useEffect(() => {
		const getLoggedinInfo = async () => {
			const { data: myinfo } = await axios.get(EMP_API_BASE_URL + "leave/my_info");
			setMyinfo(myinfo);
			console.log(myinfo)
		};
		getLoggedinInfo();
	}, []);

	React.useEffect(() => {
		const getSales = async () => {
			const { data: sales } = await axios.get(EMP_API_BASE_URL + "sales");
			setSalesData(sales);
			console.log(sales)
		};
		getSales();
	}, []);
	

	const dataForPieChart = [
		{ name: '銷售部門A', value: 900 },
		{ name: '銷售部門B', value: 1300 },
		{ name: '銷售部門C', value: 4600 },
		{ name: '銷售部門D', value: 750 },
	  ];
	  
	const renderActiveShape = (props) => {
	const RADIAN = Math.PI / 180;
	const {
		cx,
		cy,
		midAngle,
		innerRadius,
		outerRadius,
		startAngle,
		endAngle,
		fill,
		payload,
		percent,
		value
	} = props;
	const sin = Math.sin(-RADIAN * midAngle);
	const cos = Math.cos(-RADIAN * midAngle);
	const sx = cx + (outerRadius + 10) * cos;
	const sy = cy + (outerRadius + 10) * sin;
	const mx = cx + (outerRadius + 30) * cos;
	const my = cy + (outerRadius + 30) * sin;
	const ex = mx + (cos >= 0 ? 1 : -1) * 22;
	const ey = my;
	const textAnchor = cos >= 0 ? "start" : "end";
	
	return (
		<g>
		<text x={cx} y={cy} dy={8} textAnchor="middle" fill={fill}>
			{payload.name}
		</text>
		<Recharts.Sector
			cx={cx}
			cy={cy}
			innerRadius={innerRadius}
			outerRadius={outerRadius}
			startAngle={startAngle}
			endAngle={endAngle}
			fill={fill}
		/>
		<Recharts.Sector
			cx={cx}
			cy={cy}
			startAngle={startAngle}
			endAngle={endAngle}
			innerRadius={outerRadius + 6}
			outerRadius={outerRadius + 10}
			fill={fill}
		/>
		<path
			d={`M${sx},${sy}L${mx},${my}L${ex},${ey}`}
			stroke={fill}
			fill="none"
		/>
		<circle cx={ex} cy={ey} r={2} fill={fill} stroke="none" />
		<text
			x={ex + (cos >= 0 ? 1 : -1) * 12}
			y={ey}
			textAnchor={textAnchor}
			fill="#333"
		>{`$ ${value}`}</text>
		<text
			x={ex + (cos >= 0 ? 1 : -1) * 12}
			y={ey}
			dy={18}
			textAnchor={textAnchor}
			fill="#999"
		>
			{`(Rate ${(percent * 100).toFixed(2)}%)`}
		</text>
		</g>
	);
	};
	const [activeIndex, setActiveIndex] = React.useState(0);
	const onPieEnter = React.useCallback(
	  (_, index) => {
		setActiveIndex(index);
	  },
	  [setActiveIndex]
	);
	const pieChart = <Recharts.PieChart width={400} height={200}>
		<Recharts.Pie
		activeIndex={activeIndex}
		activeShape={renderActiveShape}
		data={dataForPieChart}
		cx={240}
		cy={100}
		innerRadius={60}
		outerRadius={80}
		fill="#8884d8"
		dataKey="value"
		onMouseEnter={onPieEnter}
		/>
	</Recharts.PieChart>

	//
	const data01ForScatter = [
		{ x: 10, y: 200, z: 200 },
		{ x: 12, y: 100, z: 260 },
		{ x: 17, y: 300, z: 400 },
		{ x: 14, y: 250, z: 280 },
		{ x: 15, y: 400, z: 500 },
		{ x: 11, y: 280, z: 200 }
	  ];
	  const data02ForScatter = [
		{ x: 30, y: 300, z: 200 },
		{ x: 40, y: 500, z: 260 },
		{ x: 20, y: 700, z: 400 },
		{ x: 34, y: 350, z: 280 },
		{ x: 56, y: 500, z: 500 },
		{ x: 23, y: 780, z: 200 },
		{ x: 50, y: 400, z: 200 },
		{ x: 30, y: 500, z: 260 },
		{ x: 24, y: 300, z: 400 },
		{ x: 32, y: 550, z: 280 },
		{ x: 50, y: 400, z: 500 },
		{ x: 42, y: 280, z: 200 }
	  ];
	


	  const scatter = <Recharts.ScatterChart
      width={1000}
      height={350}
	  cx={450}
	  cy={250}
      margin={{
        top: 20,
        right: 20,
        bottom: 20,
        left: 20
      }}
    >
      <Recharts.CartesianGrid />
      <Recharts.XAxis type="number" dataKey="x" name="年資" unit="個月" />
      <Recharts.YAxis
        yAxisId="left"
        type="number"
        dataKey="y"
        name="weight"
        unit=" dollars"
        stroke="#8884d8"
      />
      <Recharts.YAxis
        yAxisId="right"
        type="number"
        dataKey="y"
        name="weight"
        unit=" dollars"
        orientation="right"
        stroke="#82ca9d"
      />
      <Recharts.Tooltip cursor={{ strokeDasharray: "3 3" }} />
      <Recharts.Scatter yAxisId="left" name="A school" data={data01ForScatter} fill="#8884d8" />
      <Recharts.Scatter yAxisId="right" name="A school" data={data02ForScatter} fill="#82ca9d" />
    </Recharts.ScatterChart>

	  //
	const dataForBarChart = [
		{
		name: "Q1",
		周邊商品銷售額: 4000,
		汽車銷售額: 2400,
		amt: 2400
		},
		{
		name: "Q2",
		周邊商品銷售額: -3000,
		汽車銷售額: 1398,
		amt: 2210
		},
		{
		name: "Q3",
		周邊商品銷售額: -2000,
		汽車銷售額: -9800,
		amt: 2290
		},
		{
		name: "Q4",
		周邊商品銷售額: 2780,
		汽車銷售額: 3908,
		amt: 2000
		},

	];

	const barChart = <Recharts.BarChart
	width={400}
	height={200}
	cx={200}
	cy={150}
	data={dataForBarChart}
	stackOffset="sign"
	margin={{
	  top: 5,
	  right: 30,
	  left: 20,
	  bottom: 5
	}}
  >
	<Recharts.CartesianGrid strokeDasharray="3 3" />
	<Recharts.XAxis dataKey="name" />
	<Recharts.YAxis />
	<Recharts.Tooltip />
	<Recharts.Legend />
	<Recharts.ReferenceLine y={0} stroke="#000" />
	<Recharts.Bar dataKey="汽車銷售額" fill="#8884d8" stackId="stack" />
	<Recharts.Bar dataKey="周邊商品銷售額" fill="#82ca9d" stackId="stack" />
  </Recharts.BarChart>

	return (
		<>
			<div className="container mx-auto px-14 py-16 flex justify-between">
				<Sidebar />
				<div className="flex-wrap justify-center w-full w-4/5">
					<div className="flex justify-between">
						<h3 className="text-3xl my-6 text-slate-500"><b>Hello! {myinfo.firstName}</b></h3>
					</div>
					<div className="overflow-x-auto flex">
						<div className="container mx-auto px-14 py-16">
						
						<div className="grid grid-cols-2 gap-20">
					<div className="flex-col justify-center col-span-2">{scatter}<p className="text-center mt-6 font-extrabold text-lg text-slate-400">員工薪資年增長與年資趨勢</p></div>
					<div className="">{pieChart}<p className="text-center mt-6 font-extrabold text-lg text-slate-400">銷售部子部門總銷售額</p></div>
					<div className="">{barChart}<p className="text-center mt-6 font-extrabold text-lg text-slate-400">對比去年同期銷售額增長</p></div>
				</div>
						
							
						</div>

					</div>
				</div>
			</div>
		</>
	);





}
