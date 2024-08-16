// pages/home/home.js
const imageCdn = 'https://tdesign.gtimg.com/mobile/demos';
const swiperList = [{
    value: `https://img.picui.cn/free/2024/06/14/666c1ae43e6b9.jpg`,
    ariaLabel: '图片1',
  },
  {
    value: `https://img.picui.cn/free/2024/06/14/666c1ae618033.png`,
    ariaLabel: '图片2',
  },
  {
    value: `https://img.picui.cn/free/2024/06/14/666c1ae61b7a9.png`,
    ariaLabel: '图片1',
  },
  {
    value: `https://img.picui.cn/free/2024/06/14/666c1ae62cd89.png`,
    ariaLabel: '图片2',
  },
]
Page({
  properties: {
    navbarHeight: {
      type: Number,
      value: 0,
    },
  },
  goGoods(info) {
    // console.log(info.currentTarget.dataset.id)
    let project_id = info.currentTarget.dataset.id;
    wx.navigateTo({
      url: '../goods/goods?commodityId=' + project_id
    });
  },
  goTypes(info) {
    // console.log(info.currentTarget.dataset.id)
    let project_id = info.currentTarget.dataset.id;
    wx.navigateTo({
      url: '../types/types?commodityTypeId=' + project_id
    });
  },
  goStys(info) {
    // console.log(info.currentTarget.dataset.id)
    let project_id = info.currentTarget.dataset.id;
    wx.navigateTo({
      url: '../stys/stys?commodityStyleId=' + project_id
    });
  },
  goActivity(info) {
    // console.log(info.currentTarget.dataset.id)
    let project_id = info.currentTarget.dataset.id;
    wx.navigateTo({
      url: '../activity/activity?commodityActivityId=' + project_id
    });
  },
  /**
   * 页面的初始数据
   */
  data: {
    current: 1,
    autoplay: true,
    duration: 500,
    interval: 5000,
    swiperList,
    tabPanelstyle: 'display:flex;justify-content:center;align-items:center;',
    typeList: [],
    styleList: [],
    activityList: [],
    goodsList: [],
    tagList: [],
    Id: ''
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad(options) {
    queryType: {
      wx.request({
        url: `http://127.0.0.1:2001/api/getType`,
        method: 'GET',
        success: res => {
          // console.log(res.data.data)
          this.setData({
            typeList: res.data.data
          })
          // console.log(this.data.typeList)
        },
        fail: err => {
          console.log(err)
        }
      })
    }
    queryStyle: {
      wx.request({
        url: `http://127.0.0.1:2001/api/getStyle`,
        method: 'GET',
        success: res => {
          // console.log(res.data.data)
          this.setData({
            styleList: res.data.data
          })
          // console.log(this.data.styleList)
        },
        fail: err => {
          console.log(err)
        }
      })
    }
    queryActivity: {
      wx.request({
        url: `http://127.0.0.1:2001/api/getActivity`,
        method: 'GET',
        success: res => {
          // console.log(res.data.data)
          this.setData({
            activityList: res.data.data
          })
          // console.log(this.data.activityList)
        },
        fail: err => {
          console.log(err)
        }
      })
    }
    queryGoods: {
      wx.request({
        url: `http://127.0.0.1:2001/api/getCommodity`,
        method: 'GET',
        success: res => {
          // console.log(res.data.data)
          this.setData({
            goodsList: res.data.data
          })
          // console.log(this.data.goodsList)
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

  },
})