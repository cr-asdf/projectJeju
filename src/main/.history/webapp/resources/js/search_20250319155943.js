const select01 = document.getElementById("select01");

select01.addEventListener("click", ()=>{
  fetch('http://apis.data.go.kr/1613000/DmstcFlightNvgInfoService/getArprtList?serviceKey=J0mHq1R1fL8PBzcOJXPlaICPhvWctJpIQoAUJNzx1fUeMzFU9bjNRoAuwfN%2FC1w79pvPN5onz8835x6feTa2yA%3D%3D')
  .then(r=>r.json())
  .then(r=>{
    console.log(r)
  })
})

function getAirportList () {
  console.log('getAirportList')
}

getAirportList();