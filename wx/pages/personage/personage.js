// pages/personage/personage.js
import Message from 'tdesign-miniprogram/message/index';
import md5 from "../../utils/md5";
const app = getApp()
Page({

  /**
   * 页面的初始数据
   */
  data: {
    isLogin: false, // 登录状态
    userInfo: null, // 用户头像、昵称信息
    account: '',
    password: '',
  },
  inputAccount(e) {
    this.setData({
      account: e.detail.value
    })
  },
  inputPassword(e) {
    this.setData({
      password: e.detail.value
    })
  },
  click() {
    // console.log(this.data.account, md5(this.data.password))
    if (this.data.account == '') {
      Message.warning({
        context: this,
        offset: [90, 32],
        duration: 5000,
        content: '请输入账号！',
      });
    } else if (this.data.password == '') {
      Message.warning({
        context: this,
        offset: [90, 32],
        duration: 5000,
        content: '请输入密码！',
      });
    } else {
      wx.request({
        url: `http://127.0.0.1:2001/api/wxLogin`,
        
        data: {
          userAccount: this.data.account,
          userPassword: md5(this.data.password)
        },
        method: 'GET',
        success: res => {
          console.log(res.data.data)
          if (res.data.data.userPassword == md5(this.data.password) && res.data.data.userStateId == 1) {
            Message.success({
              context: this,
              offset: [90, 32],
              duration: 5000,
              content: '登录成功！',
            });
            wx.setStorage({
              key: 'user',
              data: res.data.data
            })            
            app.globalData.userInfo = res.data.data.userName
            app.globalData.userId = res.data.data.userId
            app.globalData.isLogin = true
            this.setData({
              isLogin: true,
              userInfo: res.data.data.userName
            })
          } else {
            Message.warning({
              context: this,
              offset: [90, 32],
              duration: 5000,
              content: '密码错误！',
            });
          }
          // console.log(this.data.typeList)
        },
        fail: err => {
          Message.warning({
            context: this,
            offset: [90, 32],
            duration: 5000,
            content: '登录失败',
          });
          console.log(err)
        }
      })
    }

  },
  logout() {
    app.globalData.isLogin = false
    app.globalData.userInfo = ''
    this.setData({
      isLogin: false,
      userInfo: ''
    })
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad(options) {

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

  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide() {

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

  },
})