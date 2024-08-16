// pages/shoppingBag/shoppingBag.js
const app = getApp()
import Message from 'tdesign-miniprogram/message/index';
Page({
  ywc(info){
    console.log(info.currentTarget.dataset.orderid)
    wx.request({
      url: `http://127.0.0.1:2001/api/updateOrder`,
      method: 'GET',
      data:{
        orderId: info.currentTarget.dataset.orderid,
        orderStateId: 1
      },
      success: res => {
        if(res.data.code == 200){
          Message.success({
            context: this,
            offset: [90, 32],
            duration: 5000,
            content: '已完成',
          });
          this.onLoad()
        }else{
          Message.warning({
            context: this,
            offset: [90, 32],
            duration: 5000,
            content: '失败',
          });
        }
      },
      fail: err => {
        console.log(err)
      }
    })
  },
  /**
   * 页面的初始数据
   */
  data: {
    orderId: '',
    isLogin: false, // 登录状态
    userInfo: null, // 用户头像、昵称信息
    userId: '',
    value:0,
    info:[]
  },
  onTabsChange(event) {
    console.log(`Change tab, tab-panel value is ${event.detail.value}.`);
    if(event.detail.value == 0){
      wx.request({
        url: `http://127.0.0.1:2001/api/getOrderUserName/`+this.data.userId,
        method: 'GET',
        success: res => {
            this.setData({
              info:res.data.data
            })
            console.log(this.data.info)
        },
        fail: err => {
          console.log(err)
        }
      })
    }else if(event.detail.value == 1){
      wx.request({
        url: `http://127.0.0.1:2001/api/getOrderWwc/`+this.data.userId,
        method: 'GET',
        success: res => {
            this.setData({
              info:res.data.data
            })
            console.log(this.data.info)
        },
        fail: err => {
          console.log(err)
        }
      })
    }else if(event.detail.value == 2){
      wx.request({
        url: `http://127.0.0.1:2001/api/getOrderYwc/`+this.data.userId,
        method: 'GET',
        success: res => {
            this.setData({
              info:res.data.data
            })
            console.log(this.data.info)
        },
        fail: err => {
          console.log(err)
        }
      })
    }
  },
  shuaxin(){
    if(this.data.isLogin == false){
      Message.warning({
        context: this,
        offset: [90, 32],
        duration: 5000,
        content: '请先登入',
      });
    }
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad(options) {
    this.setData({
      isLogin: app.globalData.isLogin,
      userInfo: app.globalData.userInfo,
      userId: app.globalData.userId,
    })
    getOrder:{
      wx.request({
        url: `http://127.0.0.1:2001/api/getOrderUserName/`+this.data.userId,
        method: 'GET',
        success: res => {
            this.setData({
              info:res.data.data
            })
            console.log(this.data.info)
        },
        fail: err => {
          console.log(err)
        }
      })
    }
  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady() {

  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow() {
    this.setData({
      isLogin: app.globalData.isLogin,
      userInfo: app.globalData.userInfo,
      userId: app.globalData.userId,
    })
    getOrder:{
      wx.request({
        url: `http://127.0.0.1:2001/api/getOrderUserName/`+this.data.userId,
        method: 'GET',
        success: res => {
            // console.log(res.data.data)
        },
        fail: err => {
          console.log(err)
        }
      })
    }
  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide() {
    this.setData({
      isLogin: app.globalData.isLogin,
      userInfo: app.globalData.userInfo,
      userId: app.globalData.userId,
    })
    getOrder:{
      wx.request({
        url: `http://127.0.0.1:2001/api/getOrderUserName/`+this.data.userId,
        method: 'GET',
        success: res => {
            // console.log(res.data.data)
        },
        fail: err => {
          console.log(err)
        }
      })
    }
  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload() {

  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh() {

  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom() {

  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage() {

  }
})