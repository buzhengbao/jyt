// pages/goods.js
const app = getApp()
import Message from 'tdesign-miniprogram/message/index';
Page({

  /**
   * 页面的初始数据
   */
  data: {
    show: false,
    current: 0,
    autoplay: false,
    duration: 500,
    interval: 5000,
    commodityId: '',
    CommodityInfo: [],
    TypeId: '',
    TagInfo: [],
    imgList: [],
    isLogin: false, // 登录状态
    userInfo: null, // 用户头像、昵称信息
    userId: '',
    client: '',
    tel: '',
    num: ''
  },
  inputClient(e){
    this.setData({
      client: e.detail.value
    })
  },
  inputTel(e){
    this.setData({
      tel: e.detail.value
    })
  },
  inputNum(e){
    this.setData({
      num: e.detail.value
    })
  },
  go(){
    if(this.data.isLogin == false){
      Message.warning({
        context: this,
        offset: [90, 32],
        duration: 5000,
        content: '请先登入',
      });
    }else{
      this.setData({
        show: true,
        client: '',
        tel: '',
        num: ''
      })
    }
  },
  no(){
    this.setData({
      show: false
    })
  },
  yes(){
    if(this.data.client == ''){
      Message.warning({
        context: this,
        offset: [90, 32],
        duration: 5000,
        content: '请输入客户名',
      });
    }else if(this.data.tel == ''){
      Message.warning({
        context: this,
        offset: [90, 32],
        duration: 5000,
        content: '请输入电话',
      });
    }else{
      wx.request({
        url: `http://127.0.0.1:2001/api/addOrder`,
        method: 'GET',
        data:{
          orderNum:'DDU' + this.data.userId + Math.floor(Math.random() * 10000000),
          userId:this.data.userId,
          commodityId:this.data.commodityId,
          client:this.data.client,
          tel:this.data.tel,
          num:this.data.num,
          addTime:new Date().toJSON().substring(0, 10) + ' ' + new Date().toTimeString().substring(0,8)
        },
        success: res => {
          if(res.data.code == 200){
            this.setData({
              show: false
            })
            Message.success({
            context: this,
            offset: [90, 32],
            duration: 5000,
            content: '订购成功',
          });
          }else{
            Message.warning({
              context: this,
              offset: [90, 32],
              duration: 5000,
              content: '订购失败',
            });
          }
        },
        fail: err => {
          Message.warning({
            context: this,
            offset: [90, 32],
            duration: 5000,
            content: '订购失败',
          });
        }
      })
    }
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad(options) {
    // console.log(options)
    this.setData({
      commodityId: options.commodityId,
      isLogin: app.globalData.isLogin,
      userInfo: app.globalData.userInfo,
      userId: app.globalData.userId,
    })
    // console.log(this.data.commodityId)
    // /getWxType/
    queryCommodity: {
      wx.request({
        url: `http://127.0.0.1:2001/api/getWxCommodity/`,
        method: 'GET',
        data: { //发送到服务器的数据
          commodityId: this.data.commodityId
        },
        success: res => {
          // console.log(res.data)
          // console.log(res.data.data[0].commodityTypeId)
          this.setData({
            CommodityInfo: res.data.data,
            TypeId: res.data.data[0].commodityTypeId
          })
          // console.log(this.data.CommodityInfo[0].commodityName)
          wx.setNavigationBarTitle({
            title: this.data.CommodityInfo[0].commodityName
          })
          // console.log(this.data.typeList)
        },
        fail: err => {
          console.log(err)
        }
      })
    }
    queryTag: {
      wx.request({
        url: `http://127.0.0.1:2001/api/getWxTag/`,
        method: 'GET',
        data: { //发送到服务器的数据
          commodityId: this.data.commodityId
        },
        success: res => {
          // console.log(res.data)
          this.setData({
            TagInfo: res.data.data
          })
          // console.log(this.data.typeList)
        },
        fail: err => {
          console.log(err)
        }
      })
    }
    queryCommodityImg: {
      wx.request({
        url: `http://127.0.0.1:2001/api/getWxCommodityImg/`,
        method: 'GET',
        data: { //发送到服务器的数据
          commodityId: this.data.commodityId
        },
        success: res => {
          // console.log(res.data.data)
          let imgList = []
          for (const i in res.data.data) {
            // console.log(res.data.data[i].commodityImgUrl)
            let img = {}
            img['value'] = res.data.data[i].commodityImgUrl
            img['ariaLabel'] = i
            // console.log(img)
            imgList.unshift(img)
          }
          // console.log(imgList)
          this.setData({
            imgList: imgList
          })
          // console.log(this.data.typeList)
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
  onReady() {},

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

  }
})