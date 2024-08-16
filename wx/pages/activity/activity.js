// pages/activity/activity.js
Page({
  goGoods(info) {
    // console.log(info.currentTarget.dataset.id)
    let project_id = info.currentTarget.dataset.id;
    wx.navigateTo({
      url: '../goods/goods?commodityId=' + project_id
    });
  },
  choosesort: function (e) {
    wx.request({
      url: `http://127.0.0.1:2001/api/getWxActivity/`,
      method: 'GET',
      data: { //发送到服务器的数据
        activityId: this.data.commodityActivityId
      },
      success: res => {
        console.log(res.data)
        // console.log(res.data.data[0].commodityActivityId)
        this.setData({
          CommodityInfo: res.data.data,
          ActivityId: res.data.data[0].commodityActivityId,
          imageurl1: "/images/banner/up.png",
          imageurl2: "/images/banner/up.png",
          imageurl3: "/images/banner/up.png",
          currentIndex: 0
        })
      },
      fail: err => {
        console.log(err)
      }
    })
  },
  choosesort1: function (e) {
    if (this.data.daindex1 == 0) {
      wx.request({
        url: `http://127.0.0.1:2001/api/getWxActivityPriceUp/`,
        method: 'GET',
        data: { //发送到服务器的数据
          activityId: this.data.commodityActivityId
        },
        success: res => {
          console.log(res.data)
          // console.log(res.data.data[0].commodityActivityId)
          this.setData({
            CommodityInfo: res.data.data,
            ActivityId: res.data.data[0].commodityActivityId,
            imageurl2: "/images/banner/up.png",
            imageurl1: "/images/banner/up_selected.png",
            imageurl3: "/images/banner/up.png",
            daindex1: 1,
            currentIndex: 1
          })
        },
        fail: err => {
          console.log(err)
        }
      })
    } else {
      wx.request({
        url: `http://127.0.0.1:2001/api/getWxActivityPriceDown/`,
        method: 'GET',
        data: { //发送到服务器的数据
          activityId: this.data.commodityActivityId
        },
        success: res => {
          console.log(res.data)
          // console.log(res.data.data[0].commodityActivityId)
          this.setData({
            CommodityInfo: res.data.data,
            ActivityId: res.data.data[0].commodityActivityId,
            imageurl2: "/images/banner/up.png",
            imageurl1: "/images/banner/down_selected.png",
            imageurl3: "/images/banner/up.png",
            daindex1: 0,
            currentIndex: 1
          })
        },
        fail: err => {
          console.log(err)
        }
      })
    }
  },
  choosesort2: function (e) {
    if (this.data.daindex2 == 0) {
      wx.request({
        url: `http://127.0.0.1:2001/api/getWxActivityWageUp/`,
        method: 'GET',
        data: { //发送到服务器的数据
          activityId: this.data.commodityActivityId
        },
        success: res => {
          console.log(res.data)
          // console.log(res.data.data[0].commodityActivityId)
          this.setData({
            CommodityInfo: res.data.data,
            ActivityId: res.data.data[0].commodityActivityId,
            imageurl1: "/images/banner/up.png",
            imageurl2: "/images/banner/up_selected.png",
            imageurl3: "/images/banner/up.png",
            daindex2: 1,
            currentIndex: 2
          })
        },
        fail: err => {
          console.log(err)
        }
      })
    } else {
      wx.request({
        url: `http://127.0.0.1:2001/api/getWxActivityWageDown/`,
        method: 'GET',
        data: { //发送到服务器的数据
          activityId: this.data.commodityActivityId
        },
        success: res => {
          console.log(res.data)
          // console.log(res.data.data[0].commodityActivityId)
          this.setData({
            CommodityInfo: res.data.data,
            ActivityId: res.data.data[0].commodityActivityId,
            imageurl1: "/images/banner/up.png",
            imageurl2: "/images/banner/down_selected.png",
            imageurl3: "/images/banner/up.png",
            daindex2: 0,
            currentIndex: 2
          })
        },
        fail: err => {
          console.log(err)
        }
      })
    }
  },
  choosesort3: function (e) {
    if (this.data.daindex3 == 0) {
      wx.request({
        url: `http://127.0.0.1:2001/api/getWxActivityTimeUp/`,
        method: 'GET',
        data: { //发送到服务器的数据
          activityId: this.data.commodityActivityId
        },
        success: res => {
          console.log(res.data)
          // console.log(res.data.data[0].commodityActivityId)
          this.setData({
            CommodityInfo: res.data.data,
            ActivityId: res.data.data[0].commodityActivityId,
            imageurl1: "/images/banner/up.png",
            imageurl2: "/images/banner/up.png",
            imageurl3: "/images/banner/up_selected.png",
            daindex3: 1,
            currentIndex: 3
          })
        },
        fail: err => {
          console.log(err)
        }
      })
    } else {
      wx.request({
        url: `http://127.0.0.1:2001/api/getWxActivityTimeDown/`,
        method: 'GET',
        data: { //发送到服务器的数据
          activityId: this.data.commodityActivityId
        },
        success: res => {
          console.log(res.data)
          // console.log(res.data.data[0].commodityActivityId)
          this.setData({
            CommodityInfo: res.data.data,
            ActivityId: res.data.data[0].commodityActivityId,
            imageurl1: "/images/banner/up.png",
            imageurl2: "/images/banner/up.png",
            imageurl3: "/images/banner/down_selected.png",
            daindex3: 0,
            currentIndex: 3
          })
        },
        fail: err => {
          console.log(err)
        }
      })
    }
  },

  /**
   * 页面的初始数据
   */
  data: {
    imageurl1: "/images/banner/up.png",
    daindex1: 0,
    imageurl2: "/images/banner/up.png",
    daindex2: 0,
    imageurl3: "/images/banner/up.png",
    daindex3: 0,
    currentIndex: 0,
    commodityActivityId: '',
    Id: '',
    activeSort: '综合',
    ascending: true,
    CommodityInfo: [],
    stickyProps: {
      zIndex: 2,
    },
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad(options) {
    this.setData({
      commodityActivityId: options.commodityActivityId
    })
    console.log(this.data.commodityActivityId)
    queryActivity: {
      wx.request({
        url: `http://127.0.0.1:2001/api/getWxActivity/`,
        method: 'GET',
        data: { //发送到服务器的数据
          activityId: this.data.commodityActivityId
        },
        success: res => {
          console.log(res.data)
          // console.log(res.data.data[0].commodityActivityId)
          this.setData({
            CommodityInfo: res.data.data,
            ActivityId: res.data.data[0].activityId
          })
          // console.log(this.data.CommodityInfo[0].commodityName)
          wx.setNavigationBarTitle({
            title: this.data.CommodityInfo[0].activityName
          })
          // console.log(this.data.ActivityList)
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