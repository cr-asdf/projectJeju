const btnSearch = document.getElementById("btnSearch")
const depAirportNm = document.getElementById("depAirportNm")
const plandGoDate = document.getElementById("plandGoDate")
const plandComeDate = document.getElementById("plandComeDate")
const person = document.getElementById("person")
const searchfrm = document.getElementById("searchfrm")


btnSearch.addEventListener("click", ()=>{
  console.log(depAirportNm.value)
  console.log(date_go.value)
  console.log(date_come.value)
  console.log(psn.value)

  // let params = new FormData();
  // params.append("select01", select01.value)
  // params.append("date_go", date_go.value)
  // params.append("date_come", date_come.value)
  // params.append("psn", psn.value)

  // fetch("./list", {
  //   method: "POST",
  //   body: params
  // })
  // .then(r=>r.text())
  // .then(r=>{
  //   location.href = "./list";
  // })

  searchfrm.submit()

})

function getAirportList () {
  let url = "http://apis.data.go.kr/1613000/DmstcFlightNvgInfoService/getArprtList?serviceKey=J0mHq1R1fL8PBzcOJXPlaICPhvWctJpIQoAUJNzx1fUeMzFU9bjNRoAuwfN%2FC1w79pvPN5onz8835x6feTa2yA%3D%3D&_type=json"

  fetch(url)
  .then(r=>r.json())
  .then(r=>{

    let ar = r.response.body.items.item

    for(let e of ar){
      
      if(e.airportId=="NAARKPC"){
        continue;
      }
      let opt = document.createElement("option")
      if(e.airportId=="NAARKSS"){
        opt.setAttribute("selected", "true")
      }
      opt.value = e.airportId
      opt.innerHTML = e.airportNm
      select01.appendChild(opt)

    }
      
  })
}

getAirportList();

