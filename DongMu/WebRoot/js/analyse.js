        // ����׼���õ�dom����ʼ��echartsʵ��
        var myChart1 = echarts.init(document.getElementById('maintest1'));

        // ָ��ͼ��������������
        var option1 = {
            title: {
                text: '����ͳ��'
            },
            tooltip: {},
            legend: {
                data:['����']
            },
            xAxis: {
                data: ["����","����","���̻�","ˮ��ͷ","����","������"]
            },
            yAxis: {},
            series: [{
                name: '����',
                type: 'bar',
                data: [5, 20, 36, 10, 10, 20]
            }]
        };

        // ʹ�ø�ָ�����������������ʾͼ��
        myChart1.setOption(option1);
        
        var myChart2 = echarts.init(document.getElementById('maintest2')); 
        option2 = {
        	    title: {
        	        text: '����ͼ�ѵ�'
        	    },
        	    tooltip: {
        	        trigger: 'axis'
        	    },
        	    legend: {
        	        data:['�ʼ�Ӫ��','���˹��','��Ƶ���','ֱ�ӷ���','��������']
        	    },
        	    grid: {
        	        left: '3%',
        	        right: '4%',
        	        bottom: '3%',
        	        containLabel: true
        	    },
        	    toolbox: {
        	        feature: {
        	            saveAsImage: {}
        	        }
        	    },
        	    xAxis: {
        	        type: 'category',
        	        boundaryGap: false,
        	        data: ['��һ','�ܶ�','����','����','����','����','����']
        	    },
        	    yAxis: {
        	        type: 'value'
        	    },
        	    series: [
        	        {
        	            name:'�ʼ�Ӫ��',
        	            type:'line',
        	            stack: '����',
        	            data:[120, 132, 101, 134, 90, 230, 210]
        	        },
        	        {
        	            name:'���˹��',
        	            type:'line',
        	            stack: '����',
        	            data:[220, 182, 191, 234, 290, 330, 310]
        	        },
        	        {
        	            name:'��Ƶ���',
        	            type:'line',
        	            stack: '����',
        	            data:[150, 232, 201, 154, 190, 330, 410]
        	        },
        	        {
        	            name:'ֱ�ӷ���',
        	            type:'line',
        	            stack: '����',
        	            data:[320, 332, 301, 334, 390, 330, 320]
        	        },
        	        {
        	            name:'��������',
        	            type:'line',
        	            stack: '����',
        	            data:[820, 932, 901, 934, 1290, 1330, 1320]
        	        }
        	    ]
        	};
        myChart2.setOption(option2);
        
        
        
        
        var myChart3 = echarts.init(document.getElementById('maintest3')); 
        function getVirtulData(year) {
            year = year || '2017';
            var date = +echarts.number.parseDate(year + '-01-01');
            var end = +echarts.number.parseDate((+year + 1) + '-01-01');
            var dayTime = 3600 * 24 * 1000;
            var data = [];
            for (var time = date; time < end; time += dayTime) {
                data.push([
                    echarts.format.formatTime('yyyy-MM-dd', time),
                    Math.floor(Math.random() * 1000)
                ]);
            }
            return data;
        }



        option3 = {
            tooltip: {
                position: 'top'
            },
            visualMap: {
                min: 0,
                max: 1000,
                calculable: true,
                orient: 'horizontal',
                left: 'center',
                top: 'top'
            },

            calendar: [
            {
                range: '2017',
                cellSize: ['auto', 20]
            },
            {
                top: 260,
                range: '2016',
                cellSize: ['auto', 20]
            },
            {
                top: 450,
                range: '2015',
                cellSize: ['auto', 20],
                right: 5
            }],

            series: [{
                type: 'heatmap',
                coordinateSystem: 'calendar',
                calendarIndex: 0,
                data: getVirtulData(2017)
            }, {
                type: 'heatmap',
                coordinateSystem: 'calendar',
                calendarIndex: 1,
                data: getVirtulData(2016)
            }, {
                type: 'heatmap',
                coordinateSystem: 'calendar',
                calendarIndex: 2,
                data: getVirtulData(2015)
            }]

        };
        myChart3.setOption(option3);
        
        var myChart4 = echarts.init(document.getElementById('maintest4')); 
        option4 = {
            tooltip: {
                trigger: 'item',
                formatter: "{a} <br/>{b}: {c} ({d}%)"
            },
            legend: {
                orient: 'vertical',
                x: 'left',
                data:['ֱ��','Ӫ�����','��������','�ʼ�Ӫ��','���˹��','��Ƶ���','�ٶ�','�ȸ�','��Ӧ','����']
            },
            series: [
                {
                    name:'������Դ',
                    type:'pie',
                    selectedMode: 'single',
                    radius: [0, '30%'],

                    label: {
                        normal: {
                            position: 'inner'
                        }
                    },
                    labelLine: {
                        normal: {
                            show: false
                        }
                    },
                    data:[
                        {value:335, name:'ֱ��', selected:true},
                        {value:679, name:'Ӫ�����'},
                        {value:1548, name:'��������'}
                    ]
                },
                {
                    name:'������Դ',
                    type:'pie',
                    radius: ['40%', '55%'],

                    data:[
                        {value:335, name:'ֱ��'},
                        {value:310, name:'�ʼ�Ӫ��'},
                        {value:234, name:'���˹��'},
                        {value:135, name:'��Ƶ���'},
                        {value:1048, name:'�ٶ�'},
                        {value:251, name:'�ȸ�'},
                        {value:147, name:'��Ӧ'},
                        {value:102, name:'����'}
                    ]
                }
            ]
        };
        myChart4.setOption(option4);
        
        var myChart5 = echarts.init(document.getElementById('maintest5')); 
        option5 = {
        	    title : {
        	        text: 'ĳվ���û�������Դ',
        	        subtext: '�����鹹',
        	        x:'center'
        	    },
        	    tooltip : {
        	        trigger: 'item',
        	        formatter: "{a} <br/>{b} : {c} ({d}%)"
        	    },
        	    legend: {
        	        orient: 'vertical',
        	        left: 'left',
        	        data: ['ֱ�ӷ���','�ʼ�Ӫ��','���˹��','��Ƶ���','��������']
        	    },
        	    series : [
        	        {
        	            name: '������Դ',
        	            type: 'pie',
        	            radius : '55%',
        	            center: ['50%', '60%'],
        	            data:[
        	                {value:335, name:'ֱ�ӷ���'},
        	                {value:310, name:'�ʼ�Ӫ��'},
        	                {value:234, name:'���˹��'},
        	                {value:135, name:'��Ƶ���'},
        	                {value:1548, name:'��������'}
        	            ],
        	            itemStyle: {
        	                emphasis: {
        	                    shadowBlur: 10,
        	                    shadowOffsetX: 0,
        	                    shadowColor: 'rgba(0, 0, 0, 0.5)'
        	                }
        	            }
        	        }
        	    ]
        	};
        myChart5.setOption(option5);
