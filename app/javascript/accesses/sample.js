window.addEventListener('DOMContentLoaded', (event) => {

  Highcharts.chart({
    colors: ["blue", "skyblue", "darkblue"],
    chart: {
      renderTo: 'container',
      // どんなタイプのグラフを表示させるか
      type: 'pie'
    },
    title: {
      // グラフのタイトル
      text: 'ユーザー数'
    },
    plotOptions: {
      pie: {
        size: 300,
        // 円グラフの内側のサイズ
        innerSize: '70%'
      }
    },
    // 表示させるデータ
    series: [
      {
        name: 'ユーザー数',
        data: [
          // 進捗25%、残り75%
          [ 'モバイル', gon.mobile ],
          [ 'PC', gon.pc ],
          [ 'タブレット', gon.tablet ]
        ]
      }
    ],
    credits:
    {  
      enabled: false,  
    } 
  });

  Highcharts.chart({
    colors: ["blue", "skyblue", "darkblue"],
    chart: {
      renderTo: 'page',
      // どんなタイプのグラフを表示させるか
      type: 'pie'
    },
    title: {
      // グラフのタイトル
      text: '応募数'
    },
    plotOptions: {
      pie: {
        size: 300,
        // 円グラフの内側のサイズ
        innerSize: '70%'
      }
    },
    // 表示させるデータ
    series: [
      {
        name: '応募数',
        data: [
          // 進捗25%、残り75%
          [ 'モバイル', gon.applicationMobile ],
          [ 'PC', gon.applicationPc ],
          [ 'タブレット', gon.applicationTablet ]
        ]
      }
    ],
    credits:
    {  
      enabled: false,  
    } 
  });

    //   お試し(関数にして呼び出す)

    // function view(name){

    //     Highcharts.chart({
    //         colors: ["blue", "skyblue", "darkblue"],
    //         chart: {
    //             renderTo: name,
    //             // どんなタイプのグラフを表示させるか
    //             type: 'pie'
    //         },
    //         title: {
    //             // グラフのタイトル
    //             text: 'ユーザー数'
    //         },
    //         plotOptions: {
    //             pie: {
    //                 size: 300,
    //             // 円グラフの内側のサイズ
    //             innerSize: '70%'
    //             }
    //         },
    //         // 表示させるデータ
    //         series: [
    //             {
    //             name: '利用者数',
    //             data: [
    //                 // 進捗25%、残り75%
    //                 [ 'モバイル', 25 ],
    //                 [ 'PC', 75 ],
    //                 [ 'タブレット', 55 ]
    //             ]
    //             }
    //         ],
    //         credits  
    //         : {  
    //         enabled: false,  
    //         } 
    //         });
    //     }
    //     view('time');


      google.load("visualization", "1", {packages:["geochart"]});
      google.setOnLoadCallback(drawRegionsMap);

      function drawRegionsMap() {

        var data = google.visualization.arrayToDataTable([
          ['Region', 'Data'],
          ['北海道', 22],
          ['青森', 12],
          ['岩手', 15],
          ['宮城', 8],
          ['秋田', 3],
          ['山形', 18],
          ['福島', 22],
          ['茨城', 67],
          ['栃木', 32],
          ['群馬', 17],
          ['埼玉', 67],
          ['千葉', 56],
          ['東京', 50],
          ['神奈川', 49],
          ['新潟', 89],
          ['富山', 92],
          ['石川', 93],
          ['福井', 90],
          ['山梨', 95],
          ['長野', 70],
          ['岐阜', 73],
          ['静岡', 75],
          ['愛知', 78],
          ['三重', 74],
          ['滋賀', 76],
          ['京都', 59],
          ['大阪', 60],
          ['兵庫', 49],
          ['奈良', 99],
          ['和歌山', 90],
          ['鳥取', 63],
          ['島根', 62],
          ['岡山', 61],
          ['広島', 79],
          ['山口', 60],
          ['徳島', 64],
          ['香川', 64],
          ['愛媛', 64],
          ['高知', 62],
          ['福岡', 71],
          ['佐賀', 63],
          ['長崎', 63],
          ['熊本', 53],
          ['大分', 53],
          ['宮崎', 53],
          ['鹿児島', 54],
          ['沖縄', 53]
        ]);

        var options = {
        region: 'JP',
        resolution: 'provinces',
        legend: 'none',
        backgroundColor: '#81d4fa',
        colorAxis: {colors: ['blue']}
      };

        var chart = new google.visualization.GeoChart(document.getElementById('regions_div'));

        chart.draw(data, options);
      }
});
