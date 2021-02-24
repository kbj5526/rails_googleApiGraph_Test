class AccessesController < ApplicationController
  def index

    @search_params = search_params

    # アクセス数
    @access = Access.search(@search_params)

    gon.mobile = @device_mobile = 0
    gon.pc = @device_pc = 0
    gon.tablet = @device_tablet = 0

    @access.each do |access|
      if Device.find_by(user_id: access.user_id).device_name == "モバイル"
        gon.mobile += 1
      elsif Device.find_by(user_id: access.user_id).device_name == "PC"
        gon.pc += 1
      else
        gon.tablet += 1
      end
    end

    @user_device = gon.pc + gon.mobile + gon.tablet

    # 応募数
    @access_application = Access.search(@search_params).where(application: 1)

    gon.applicationMobile = 0
    gon.applicationPc = 0
    gon.applicationTablet = 0

    @access_application.each do |application|
      if Device.find_by(user_id: application.user_id).device_name == "モバイル"
        gon.applicationMobile += 1
      elsif Device.find_by(user_id: application.user_id).device_name == "PC"
        gon.applicationPc += 1
      else
        gon.applicationTablet += 1
      end
    end

    @application_device = gon.applicationMobile + gon.applicationPc + gon.applicationTablet

    month = [ 7, 8]
    user_count = [ Access.where(access_date: "2020-07-20").pluck(:id).size, Access.where(access_date: "2020-08-20").pluck(:id).size]

    #折れ線グラフ
    @chart_line = LazyHighCharts::HighChart.new("graph") do |c|
      c.title(text: "7-8月ユーザー数")
      c.xAxis(categories: month)
      c.series(name: "ユーザー数", data: user_count, color: "blue")
      c.chart(width: 600, height: 400)
    end

    #棒グラフ
    access_july = Access.where(access_date: "2020-07-20").pluck(:id).size
    access_august = Access.where(access_date: "2020-08-20").pluck(:id).size
    access_months = [access_july, access_august]

    @chart_stick = LazyHighCharts::HighChart.new("graph") do |c|
      c.title(text: "7-8月ユーザー数")
      # X軸の名称を設定 '月'
      c.xAxis(categories: month, title: {text: '月'}, width: 200)
      c.yAxis(title: {text: '人'}, height: 200)
      c.series(name: "ユーザー数", data: access_months, color: "blue")
      # 判例を右側に配置
      c.legend(align: 'right', verticalAlign: 'top', 
        x: -100, y: 180, layout: 'vertical')
      # グラフの種類を「折れ線グラフ」から「棒グラフ」に変更
      c.chart(type: "column", width: 600, height: 400)
    end
  end

  #非同期通信
  def access
    month = [ 7, 8]
    user_count = [ Access.where(access_date: "2020-07-20").pluck(:id).size, Access.where(access_date: "2020-08-20").pluck(:id).size]
    application_count = [ Access.where(access_date: "2020-07-20").where(application: 1).pluck(:id).size, Access.where(access_date: "2020-08-20").where(application: 1).pluck(:id).size]

    access_july = Access.where(access_date: "2020-07-20").pluck(:id).size
    access_august = Access.where(access_date: "2020-08-20").pluck(:id).size
    access_months = [access_july, access_august]

    application_july = Access.where(access_date: "2020-07-20").where(application: 1).pluck(:id).size
    application_august = Access.where(access_date: "2020-08-20").where(application: 1).pluck(:id).size
    application_months = [application_july, application_august]

    #ユーザー数
    if params[:id] == "1"
      # 折れ線グラフ
      @chart_graph = LazyHighCharts::HighChart.new("graph") do |c|
        c.title(text: "7-8月ユーザー数")
        c.xAxis(categories: month)
        c.series(name: "ユーザー数", data: user_count, color: "blue")
        c.chart(width: 600, height: 400)
      end
      #棒グラフ
      @chart_stick_graph = LazyHighCharts::HighChart.new("graph") do |c|
        c.title(text: "7-8月ユーザー数")
        c.xAxis(categories: month, title: {text: '月'})
        c.yAxis(title: {text: '人'})
        c.series(name: "ユーザー数", data: access_months, color: "blue")
        c.legend(align: 'right', verticalAlign: 'top', 
          x: -100, y: 180, layout: 'vertical')
        c.chart(type: "column", width: 600, height: 400)
      end

    #応募数
    elsif params[:id] == "2"
      #折れ線グラフ
      @chart_graph = LazyHighCharts::HighChart.new("graph") do |c|
        c.title(text: "7-8月応募数")
        c.xAxis(categories: month)
        c.series(name: "応募数", data: application_count, color: "blue")
        c.chart(width: 600, height: 400)
      end
      #棒グラフ
      @chart_stick_graph = LazyHighCharts::HighChart.new("graph") do |c|
        c.title(text: "7-8月応募数")
        # X軸の名称を設定 '月'
        c.xAxis(categories: month, title: {text: '月'})
        c.yAxis(title: {text: '人'})
        c.series(name: "ユーザー数", data: application_months, color: "blue")
        # 判例を右側に配置
        c.legend(align: 'right', verticalAlign: 'top', 
          x: -100, y: 180, layout: 'vertical')
        c.chart(type: "column", width: 600, height: 400)
      end
    end
  end

  def search_params
    params.fetch(:search, {}).permit(:join_from, :join_to)
  end
end
