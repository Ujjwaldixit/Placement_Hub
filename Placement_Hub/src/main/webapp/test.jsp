<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <!DOCTYPE html>
    <html>
    <title>W3.CSS Template</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        html,
        body,
        h1,
        h2,
        h3,
        h4,
        h5 {
            font-family: "Raleway", sans-serif
        }
    </style>
    <style>
        body {
            background: #fff;
            color: #333;
            font: 12px/20px 'Helvetica Neue', Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        h2 {
            font-size: 18px;
            font-weight: normal;
            line-height: 20px;
            margin: 0 0 20px 0;
            padding: 0;
            text-align: center;
        }

        h4 {
            color: #545454;
            font-size: 14px;
            font-weight: normal;
            line-height: 20px;
            margin: 0 0 20px 0;
            padding: 0;
            text-align: center;
        }

        a {
            color: #333;
        }

        /* Table */
        #data-table {
            border: none;
            /* Turn off all borders */
            border-top: 1px solid #ccc;
            width: 60%;
        }

        #data-table th,
        #data-table td {
            border: none;
            /* Turn off all borders */
            border-bottom: 1px solid #ccc;
            margin: 0;
            padding: 10px;
            text-align: left;
        }

        /* Toggle */
        .toggles {
            background: #ebebeb;
            color: #545454;
            height: 20px;
            padding: 15px;
        }

        .toggles p {
            margin: 0;
        }

        .toggles a {
            background: #222;
            border-radius: 3px;
            color: #fff;
            display: block;
            float: left;
            margin: 0 10px 0 0;
            padding: 0 6px;
            text-decoration: none;
        }

        .toggles a:hover {
            background: #666;
        }

        #reset-graph-button {
            float: right;
        }

        /* Graph */
        /* Containers */
        #wrapper {
            margin: 25px auto;
            width: 50%;
        }

        #figure {
            height: 300px;
            position: relative;
        }

        #figure ul {
            list-style: none;
            margin: 0;
            padding: 0;
        }

        .graph {
            height: 283px;
            position: relative;
        }

        /* Legend */
        .legend {
            background: #f0f0f0;
            border-radius: 4px;
            bottom: 0;
            position: absolute;
            text-align: left;
            width: 540px;
        }

        .legend li {
            display: block;
            float: left;
            height: 20px;
            margin: 0;
            padding: 10px 30px;
            width: 120px;
        }

        .legend span.icon {
            background-position: 50% 0;
            border-radius: 2px;
            display: block;
            float: left;
            height: 16px;
            margin: 2px 10px 0 0;
            width: 16px;
        }

        /* X-Axis */
        .x-axis {
            bottom: 0;
            color: #555;
            position: absolute;
            text-align: center;
            width: 100%;
        }

        .x-axis li {
            float: left;
            margin: 0 15px;
            padding: 5px 0;
            width: 10%;
        }

        .x-axis li span {
            float: left;
        }

        /* Y-Axis */
        .y-axis {
            color: #555;
            position: absolute;
            text-align: right;
            width: 100%;
        }

        .y-axis li {
            border-top: 1px solid #ccc;
            display: block;
            height: 62px;
            width: 100%;
        }

        .y-axis li span {
            display: block;
            margin: -10px 0 0 -60px;
            padding: 0 10px;
            width: 40px;
        }

        /* Graph Bars */
        .bars {
            height: 253px;
            position: absolute;
            width: 100%;
            z-index: 10;
        }

        .bar-group {
            float: left;
            height: 100%;
            margin: 0 15px;
            position: relative;
            width: 10%;
        }

        .bar {
            border-radius: 3px 3px 0 0;
            bottom: 0;
            cursor: pointer;
            height: 0;
            position: absolute;
            text-align: center;
            width: 24px;
        }

        .bar span {
            background: #fefefe;
            border-radius: 3px;
            left: -8px;
            display: none;
            margin: 0;
            position: relative;
            text-shadow: rgba(255, 255, 255, 0.8) 0 1px 0;
            width: 40px;
            z-index: 20;

            -webkit-box-shadow: rgba(0, 0, 0, 0.6) 0 1px 4px;
            box-shadow: rgba(0, 0, 0, 0.6) 0 1px 4px;
        }

        .bar:hover span {
            display: block;
            margin-top: -25px;
        }

        #data-table.js {
            display: none;
        }

        .bar span {
            background: #fefefe;
        }

        .fig0 {
            background: #a22;
        }


        .card-shadow {
            border: 1px solid white;
            background-color: #fff;
            box-shadow: 0px 15px 16.83px 0.17px rgb(0 0 0 / 5%);
            border-radius: 20px;
            margin-left: 10%;
            margin-right: 10%;

        }

        @media screen and (max-width: 850px) {
            .bar {
                width: 24px;
            }

            .card-shadow {
                padding: 0;
                margin: 25px;
            }

            #wrapper {
                /* margin: 102px; */
                margin-left: 74px;
                width: 70%;
            }

            .chart h2 {
                padding-right: 36px;
                margin: 0;
            }

            .x-axis li {
                float: left;
                margin: 0 10px;
                padding: 5px 0;
                width: 10%;
            }

            .bar-group {
                float: left;
                height: 100%;
                margin: 0 10px;
                position: relative;
                /* width: 20px; */
            }
        }
    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
        integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
        crossorigin="anonymous"></script>


    <body class="w3-light-grey">

        <!-- Top container -->
        

        <!-- Sidebar/menu -->
       


        <!-- Overlay effect when opening sidebar on small screens -->
      

        <!-- !PAGE CONTENT! -->
        <div class="w3-main" style="margin-left:300px;margin-top:43px;">
            <div class="card-shadow">
                <div id="wrapper">
                    <div class="chart">
                        <h2>Skillset</h2>
                        <table id="data-table" border="1" cellpadding="10" cellspacing="0" summary="skillset">
                            <thead>
                                <tr>
                                    <td>&nbsp;</td>
                                    <th scope="col">CSS</th>
                                    <th scope="col">SEO</th>
                                    <th scope="col">Design</th>
                                    <th scope="col">HTML</th>
                                    <th scope="col">CMS</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>90</td>
                                    <td>50</td>
                                    <td>80</td>
                                    <td>95</td>
                                    <td>80</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>



        <script>
            // Get the Sidebar
            var mySidebar = document.getElementById("mySidebar");

            // Get the DIV with overlay effect
            var overlayBg = document.getElementById("myOverlay");

            // Toggle between showing and hiding the sidebar, and add overlay effect
            function w3_open() {
                if (mySidebar.style.display === 'block') {
                    mySidebar.style.display = 'none';
                    overlayBg.style.display = "none";
                } else {
                    mySidebar.style.display = 'block';
                    overlayBg.style.display = "block";
                }
            }

            // Close the sidebar with the close button
            function w3_close() {
                mySidebar.style.display = "none";
                overlayBg.style.display = "none";
            }
        </script>
        <script>
            // Wait for the DOM to load everything, just to be safe
            $(document).ready(function () {
                // hide table if js enabled
                $('#data-table').addClass('js');

                // Create our graph from the data table and specify a container to put the graph in
                createGraph('#data-table', '.chart');

                // Here be graphs
                function createGraph(data, container) {
                    // Declare some common variables and container elements	
                    var bars = [];
                    var figureContainer = $('<div id="figure"></div>');
                    var graphContainer = $('<div class="graph"></div>');
                    var barContainer = $('<div class="bars"></div>');
                    var data = $(data);
                    var container = $(container);
                    var chartData;
                    var chartYMax;
                    var columnGroups;

                    // Timer variables
                    var barTimer;
                    var graphTimer;

                    // Create table data object
                    var tableData = {
                        // Get numerical data from table cells
                        chartData: function () {
                            var chartData = [];
                            data.find('tbody td').each(function () {
                                chartData.push($(this).text());
                            });
                            return chartData;
                        },
                        // Get heading data from table caption
                        chartHeading: function () {
                            var chartHeading = data.find('caption').text();
                            return chartHeading;
                        },
                        // Get legend data from table body
                        chartLegend: function () {
                            var chartLegend = [];
                            // Find th elements in table body - that will tell us what items go in the main legend
                            data.find('tbody th').each(function () {
                                chartLegend.push($(this).text());
                            });
                            return chartLegend;
                        },
                        // Get highest value for y-axis scale
                        chartYMax: function () {
                            var chartData = this.chartData();
                            // Round off the value
                            var chartYMax = Math.ceil(Math.max.apply(Math, chartData) / 100) * 100;
                            return chartYMax;
                        },
                        // Get y-axis data from table cells
                        yLegend: function () {
                            var chartYMax = this.chartYMax();
                            var yLegend = [];
                            // Number of divisions on the y-axis
                            var yAxisMarkings = 5;
                            // Add required number of y-axis markings in order from 0 - max
                            for (var i = 0; i < yAxisMarkings; i++) {
                                yLegend.unshift(((chartYMax * i) / (yAxisMarkings - 1)));
                            }
                            return yLegend;
                        },
                        // Get x-axis data from table header
                        xLegend: function () {
                            var xLegend = [];
                            // Find th elements in table header - that will tell us what items go in the x-axis legend
                            data.find('thead th').each(function () {
                                xLegend.push($(this).text());
                            });
                            return xLegend;
                        },
                        // Sort data into groups based on number of columns
                        columnGroups: function () {
                            var columnGroups = [];
                            // Get number of columns from first row of table body
                            var columns = data.find('tbody tr:eq(0) td').length;
                            for (var i = 0; i < columns; i++) {
                                columnGroups[i] = [];
                                data.find('tbody tr').each(function () {
                                    columnGroups[i].push($(this).find('td').eq(i).text());
                                });
                            }
                            return columnGroups;
                        }
                    }

                    // Useful variables for accessing table data		
                    chartData = tableData.chartData();
                    chartYMax = tableData.chartYMax();
                    columnGroups = tableData.columnGroups();

                    // Construct the graph

                    // Loop through column groups, adding bars as we go
                    $.each(columnGroups, function (i) {
                        // Create bar group container
                        var barGroup = $('<div class="bar-group"></div>');
                        // Add bars inside each column
                        for (var j = 0, k = columnGroups[i].length; j < k; j++) {
                            // Create bar object to store properties (label, height, code etc.) and add it to array
                            // Set the height later in displayGraph() to allow for left-to-right sequential display
                            var barObj = {};
                            barObj.label = this[j];
                            barObj.height = Math.floor(barObj.label / chartYMax * 100) + '%';
                            barObj.bar = $('<div class="bar fig' + j + '"><span>' + barObj.label + '%</span></div>')
                                .appendTo(barGroup);
                            bars.push(barObj);
                        }
                        // Add bar groups to graph
                        barGroup.appendTo(barContainer);
                    });

                    // Add heading to graph
                    var chartHeading = tableData.chartHeading();
                    var heading = $('<h4>' + chartHeading + '</h4>');
                    heading.appendTo(figureContainer);

                    // Add legend to graph
                    var chartLegend = tableData.chartLegend();
                    var legendList = $('<ul class="legend"></ul>');
                    $.each(chartLegend, function (i) {
                        var listItem = $('<li><span class="icon fig' + i + '"></span>' + this + '</li>')
                            .appendTo(legendList);
                    });
                    legendList.appendTo(figureContainer);

                    // Add x-axis to graph
                    var xLegend = tableData.xLegend();
                    var xAxisList = $('<ul class="x-axis"></ul>');
                    $.each(xLegend, function (i) {
                        var listItem = $('<li><span>' + this + '</span></li>')
                            .appendTo(xAxisList);
                    });
                    xAxisList.appendTo(graphContainer);

                    // Add y-axis to graph	
                    var yLegend = tableData.yLegend();
                    var yAxisList = $('<ul class="y-axis"></ul>');
                    $.each(yLegend, function (i) {
                        var listItem = $('<li><span>' + this + '%</span></li>')
                            .appendTo(yAxisList);
                    });
                    yAxisList.appendTo(graphContainer);

                    // Add bars to graph
                    barContainer.appendTo(graphContainer);

                    // Add graph to graph container		
                    graphContainer.appendTo(figureContainer);

                    // Add graph container to main container
                    figureContainer.appendTo(container);

                    // Set individual height of bars
                    function displayGraph(bars, i) {
                        // Changed the way we loop because of issues with $.each not resetting properly
                        if (i < bars.length) {
                            // Animate height using jQuery animate() function
                            $(bars[i].bar).animate({
                                height: bars[i].height
                            }, 800);
                            // Wait the specified time then run the displayGraph() function again for the next bar
                            barTimer = setTimeout(function () {
                                i++;
                                displayGraph(bars, i);
                            }, 100);
                        }
                    }

                    // Reset graph settings and prepare for display
                    function resetGraph() {
                        // Stop all animations and set bar height to 0
                        $.each(bars, function (i) {
                            $(bars[i].bar).stop().css('height', 0);
                        });

                        // Clear timers
                        clearTimeout(barTimer);
                        clearTimeout(graphTimer);

                        // Restart timer		
                        graphTimer = setTimeout(function () {
                            displayGraph(bars, 0);
                        }, 200);
                    }

                    // Helper functions

                    // Call resetGraph() when button is clicked to start graph over
                    $('#reset-graph-button').click(function () {
                        resetGraph();
                        return false;
                    });

                    // Finally, display graph via reset function
                    resetGraph();
                }
            });

        </script>

    </body>

    </html>