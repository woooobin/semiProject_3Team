<%@ page import="com.poosil.projects.dto.ProjectDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="styles/reset.css" rel="stylesheet">
	<link href="styles/layout.css" rel="stylesheet">
	<link href="styles/ranking.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
	<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@0.7.0"></script>
	<script>
		const topLikeList = [];
		const topPriceList = [];
		const topCategoryList = [];
		<%
		List<ProjectDto> topLikeList = (List<ProjectDto>) request.getAttribute("topLikeList");
		
		for(ProjectDto dto : topLikeList){
			%>	topLikeList.push(
				{						
					likeCount :	<%= dto.getLikeCount()%>,
					mainTitle :	"<%= dto.getProjectMainTitle()%>",
					projectId : "<%= dto.getProjectId()%>",
				}
			);<% 
		};
		
		
		List<ProjectDto> topPriceList = (List<ProjectDto>) request.getAttribute("topPriceList");
	
		for(ProjectDto dto : topPriceList){
			%>	topPriceList.push(
					{						
						topPrice :	<%= dto.getTotalPrice()%>,
						mainTitle :	"<%= dto.getProjectMainTitle()%>",
						projectId : "<%=dto.getProjectId()%>"
					}
					
					
			);<% 
		}
		List<Integer> topCategoryList = (List<Integer>) request.getAttribute("topCategoryList");
		List<String> topCategoryNameList = (List<String>) request.getAttribute("topCategoryNameList");
		
		
		for(int i = 0 ; i < topCategoryList.size(); i++){
			%>	topCategoryList.push(
					{						
						count :	<%= topCategoryList.get(i) %>, // 사실 카운트가 맞는데 토탈프라이스로 넣었다. 
						categoryName : '<%=topCategoryNameList.get(i)%>'
					}
			);<% 
		}

		%>
		const sumVal = topCategoryList.map(x => x.count ).reduce((x, y) => x + y );
		
		onload = function(){
			document.querySelector(".firstCateName").textContent = topCategoryList[0].categoryName;
			document.querySelector(".firstCatePercent").textContent = Math.floor((  topCategoryList[0].count / sumVal) * 100 ) +"%";
			document.querySelector(".secondCateName").textContent = topCategoryList[1].categoryName;
			document.querySelector(".secondCatePercent").textContent = Math.floor((  topCategoryList[1].count / sumVal) * 100 ) +"%";
		}
	</script>
</head>
<body>
	<%@ include file="../ui/header.jsp"%>
	<div class="container rank-container">
		<h2> 가장 많이 사랑받은 프로젝트 상위 Top 10 </h2>
		<p>현재 '<%=topLikeList.get(0).getProjectMainTitle() %>' 가 가장 많은 좋아요를 받은 프로젝트에요 :) </p >
		<div class="chartwrap">
			<canvas id="hotChart" role="img" height="500px"></canvas>
		</div>
		<h2> 어떤 분야의 프로젝트가 가장 많이 판매되고 있을까요? </h2>
		<p> 현재 <%=topCategoryNameList.get(0) %> 분야의 물건이 가장 많이 판매되고 있어요! </p>
		<div class="chartcont-wrap">
			<div class="chartcont">
				<canvas id="firstCateChart" width="232" height="232" role="img"></canvas>
				<span class="firstCateName" >
					
				</span>
				<p class="firstCatePercent">
				</p>
			</div>
			<div class="chartcont">
				<canvas id="secondCateChart" width="232" height="232" 
					role="img"></canvas>
					<span class="secondCateName"></span>
				<p class="secondCatePercent">
					
				</p>
			</div>
		</div>
		<h2> 가장 많이 팔린 프로젝트 상위 Top 10 </h2>
		<p>현재 ' <%=topPriceList.get(0).getProjectMainTitle() %>' 이 가장 많은 판매 수익을 기록한 프로젝트에요! </p>
		<div class="chart-wrap">
			<canvas id="topPriceChart" width="232"  height="500px" aria-label="pc chart" role="img"></canvas>
		</div>
	</div>
	<script>
        Chart.elements.Rectangle.prototype.draw = function () { function t(t) { return s[(f + t) % 4] } var r, e, i, o, _, h, l, a, b = this._chart.ctx, d = this._view, n = d.borderWidth, u = this._chart.config.options.cornerRadius; if (u < 0 && (u = 0), void 0 === u && (u = 0), d.horizontal ? (r = d.base, e = d.x, i = d.y - d.height / 2, o = d.y + d.height / 2, _ = e > r ? 1 : -1, h = 1, l = d.borderSkipped || "left") : (r = d.x - d.width / 2, e = d.x + d.width / 2, i = d.y, _ = 1, h = (o = d.base) > i ? 1 : -1, l = d.borderSkipped || "bottom"), n) { var T = Math.min(Math.abs(r - e), Math.abs(i - o)), v = (n = n > T ? T : n) / 2, g = r + ("left" !== l ? v * _ : 0), c = e + ("right" !== l ? -v * _ : 0), C = i + ("top" !== l ? v * h : 0), w = o + ("bottom" !== l ? -v * h : 0); g !== c && (i = C, o = w), C !== w && (r = g, e = c) } b.beginPath(), b.fillStyle = d.backgroundColor, b.strokeStyle = d.borderColor, b.lineWidth = n; var s = [[r, o], [r, i], [e, i], [e, o]], f = ["bottom", "left", "top", "right"].indexOf(l, 0); -1 === f && (f = 0); var q = t(0); b.moveTo(q[0], q[1]); for (var m = 1; m < 4; m++)q = t(m), nextCornerId = m + 1, 4 == nextCornerId && (nextCornerId = 0), nextCorner = t(nextCornerId), width = s[2][0] - s[1][0], height = s[0][1] - s[1][1], x = s[1][0], y = s[1][1], (a = u) > Math.abs(height) / 2 && (a = Math.floor(Math.abs(height) / 2)), a > Math.abs(width) / 2 && (a = Math.floor(Math.abs(width) / 2)), height < 0 ? (x_tl = x, x_tr = x + width, y_tl = y + height, y_tr = y + height, x_bl = x, x_br = x + width, y_bl = y, y_br = y, b.moveTo(x_bl + a, y_bl), b.lineTo(x_br - a, y_br), b.quadraticCurveTo(x_br, y_br, x_br, y_br - a), b.lineTo(x_tr, y_tr + a), b.quadraticCurveTo(x_tr, y_tr, x_tr - a, y_tr), b.lineTo(x_tl + a, y_tl), b.quadraticCurveTo(x_tl, y_tl, x_tl, y_tl + a), b.lineTo(x_bl, y_bl - a), b.quadraticCurveTo(x_bl, y_bl, x_bl + a, y_bl)) : width < 0 ? (x_tl = x + width, x_tr = x, y_tl = y, y_tr = y, x_bl = x + width, x_br = x, y_bl = y + height, y_br = y + height, b.moveTo(x_bl + a, y_bl), b.lineTo(x_br - a, y_br), b.quadraticCurveTo(x_br, y_br, x_br, y_br - a), b.lineTo(x_tr, y_tr + a), b.quadraticCurveTo(x_tr, y_tr, x_tr - a, y_tr), b.lineTo(x_tl + a, y_tl), b.quadraticCurveTo(x_tl, y_tl, x_tl, y_tl + a), b.lineTo(x_bl, y_bl - a), b.quadraticCurveTo(x_bl, y_bl, x_bl + a, y_bl)) : (b.moveTo(x + a, y), b.lineTo(x + width - a, y), b.quadraticCurveTo(x + width, y, x + width, y + a), b.lineTo(x + width, y + height - a), b.quadraticCurveTo(x + width, y + height, x + width - a, y + height), b.lineTo(x + a, y + height), b.quadraticCurveTo(x, y + height, x, y + height - a), b.lineTo(x, y + a), b.quadraticCurveTo(x, y, x + a, y)); b.fill(), n && b.stroke() };
        
        // 여기 포문 너무 많이 도니까 리팩토링 꼭 하자 ㅠㅜ
        function argMax(array) {
            return array.map((x, i) => [x, i]).reduce((r, a) => (a[0] > r[0] ? a : r))[1];
        }
        const hotChartData = topLikeList.map(x => x.likeCount);
        var color = hotChartData.map(x => '#d5eaed');

        color[argMax(hotChartData)] = '#6481ff';

        var hotChart = document.getElementById('hotChart').getContext('2d');
        var chartSecond = new Chart(hotChart, {
            type: 'bar',
            data: {
                labels: topLikeList.map(x => x.mainTitle),
                datasets: [{
                    data: hotChartData,
                    backgroundColor: color,
                    borderWidth: 0
                }]
            },
            options: {
                maintainAspectRatio: false,
                cornerRadius: 40,
                legend: {
                    display: false
                },
                scales: {
                    xAxes: [{
                        barThickness: 40,
                        gridLines: {
                            drawOnChartArea: false
                        },
                        ticks: {
                            fontSize: 14
                        }
                    }],
                    yAxes: [{
                        display: false,
                        ticks: {
                            max: Math.max(...topLikeList.map(x => x.likeCount)) + 50,
                            min : -10,
                            //display: false,
                            beginAtZero: true
                        },
                        gridLines: {
                            drawOnChartArea: true
                        },

                    }]
                },
                plugins: {
                    datalabels: {
                        align: 'start',
                        anchor: 'end',
                        color: function (context) {
                            var index = context.dataIndex;
                            var value = context.dataset.data[index];
                            return value == Math.max(...context.dataset.data) ? "#6481ff" : "#95b5ba"
                        },
                        font: function (context) {
                            var index = context.dataIndex;
                            var value = context.dataset.data[index];
                            return value < Math.max(...context.dataset.data) ? {
                                size: "14",
                                weight: "400"
                            } : {
                                size: "18",
                                weight: "700"
                            }
                        },
                        offset: -10,
                        padding: 0
                    }
                }
            }
        });
        
        
        
        /* console.log( sumVal, topCategoryList[0].count ); */
        
        
        var firstCateChart = document.getElementById('firstCateChart').getContext('2d');
        var chartThird = new Chart(firstCateChart, {
            type: 'doughnut',
            data: {
                datasets: [{
                    data: [  ( sumVal - topCategoryList[0].count ), topCategoryList[0].count],
                    backgroundColor: [
                        "#e8e8e8", "#6481ff"
                    ],
                    weight: 30,
                    datalabels: {
                        labels: {
                            title: null
                        }
                    }
                }]
            },
            options: {
                responsive: true,
                cutoutPercentage: 90,
                legend: {
                    display: false
                }
            }
        });

        var secondCateChart = document.getElementById('secondCateChart').getContext('2d');
        var chartFourth = new Chart(secondCateChart, {
            type: 'doughnut',
            data: {
                datasets: [{
                    data: [ ( sumVal - topCategoryList[1].count ), topCategoryList[1].count ],
                    backgroundColor: [
                        "#e8e8e8", "#1ad8f5"
                    ],
                    datalabels: {
                        labels: {
                            title: null
                        }
                    }
                }]
            },
            options: {
                responsive: true,
                cutoutPercentage: 95,
                legend: {
                    display: false
                }
            }
        });
        
        
        new Chart( document.getElementById('topPriceChart').getContext('2d'), {
            type: 'bar',
            data: {
                labels: topPriceList.map(x => x.mainTitle),
                datasets: [{
                    data: topPriceList.map(x => x.topPrice),
                    backgroundColor: color,
                    borderWidth: 0
                }]
            },
            options: {
                maintainAspectRatio: false,
                cornerRadius: 40,
                legend: {
                    display: false
                },
                scales: {
                    xAxes: [{
                        barThickness: 40,
                        gridLines: {
                            drawOnChartArea: false
                        },
                        ticks: {
                            fontSize: 14
                        }
                    }],
                    yAxes: [{
                        display: false,
                        ticks: {
                            max: Math.max(...topPriceList.map(x => x.topPrice)) + 50,
                            //display: false,
                            min : -10,
                            beginAtZero: true
                        },
                        gridLines: {
                            drawOnChartArea: true
                        },

                    }]
                },
                plugins: {
                    datalabels: {
                        align: 'start',
                        anchor: 'end',
                        color: function (context) {
                            var index = context.dataIndex;
                            var value = context.dataset.data[index];
                            return value == Math.max(...context.dataset.data) ? "#6481ff" : "#95b5ba"
                        },
                        font: function (context) {
                            var index = context.dataIndex;
                            var value = context.dataset.data[index];
                            return value < Math.max(...context.dataset.data) ? {
                                size: "14",
                                weight: "400"
                            } : {
                                size: "18",
                                weight: "700"
                            }
                        },
                        offset: -28,
                        padding: 0
                    }
                }
            }
        });
    </script>
</body>
</html>