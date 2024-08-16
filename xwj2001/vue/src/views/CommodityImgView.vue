<template>
  <div class="common-layout">
    <el-container>
      <el-header>
        <el-row :gutter="12">
          <el-col :span="12">
            <el-button plain @click="openAdd">
              新增照片
            </el-button>
          </el-col>
          <el-col :span="12">
            <el-form :model="form" @submit.native.prevent>
              <el-form-item>
                <el-row :gutter="10">
                  <el-col :span="14">
                    <el-select v-model="imgName" filterable placeholder="选择商品" style="width: 200px">
                      <el-option v-for="item in Commodity" :key="item.commodityId" :label="item.commodityName"
                                 :value="item.commodityName"
                      ></el-option>
                    </el-select>
                  </el-col>
                  <el-col :span="5">
                    <el-button type="danger" @click="clean">清空</el-button>
                  </el-col>
                  <el-col :span="5">
                    <el-button type="primary" @click="queryImg(this.imgName)">Query</el-button>
                  </el-col>
                </el-row>
              </el-form-item>
            </el-form>
          </el-col>
        </el-row>
        <hr/>
      </el-header>
      <el-main>
        <hr/>
        <el-table :data="tableData" style="height:440px; width: 100%">
          <el-table-column prop="commodityImgId" label="照片ID"/>
          <el-table-column prop="commodityName" label="商品名称"/>
          <el-table-column label="照片" v-slot="Style">
            <el-image style="width: 50%" :src="Style.row.commodityImgUrl"></el-image>
          </el-table-column>
          <el-table-column label="操作" width="200" v-slot="scope">
            <el-button plain @click="openUpdate(scope.row)">
              修改
            </el-button>
            <el-popconfirm :title='"你确定要删除&emsp;" + "<" + scope.row.commodityName + ">" + "?"'
                           @confirm='ImgDel(scope.row.commodityImgId)'>
              <template #reference>
                <el-button>删除</el-button>
              </template>
            </el-popconfirm>
          </el-table-column>
        </el-table>
      </el-main>
    </el-container>
  </div>
  <el-dialog v-model="dialogFormVisible" title="修改照片" width="500">
    <el-form :model="form">
      <el-form-item label="商品名称" >
        <el-select v-model="imgName" filterable placeholder="选择商品" style="width: 240px">
          <el-option v-for="item in Commodity" :key="item.commodityId" :label="item.commodityName"
                     :value="item.commodityId"
          ></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="图片">
        <input type="file" @change="getFile($event)">
        <el-button @click="post()" v-loading.fullscreen.lock="fullscreenLoading">确认上传</el-button>
      </el-form-item>
    </el-form>
    <template #footer>
      <div class="dialog-footer">
        <el-button type="primary" @click="updateImg(form)">
          确定
        </el-button>
      </div>
    </template>
  </el-dialog>
  <el-dialog v-model="dialogFormVisible1" title="新增照片" width="500">
    <el-form :model="form">
      <el-form-item label="商品名称">
        <el-select v-model="imgName" filterable placeholder="选择商品" style="width: 240px">
          <el-option v-for="item in Commodity" :key="item.commodityId" :label="item.commodityName"
                     :value="item.commodityId"
          ></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="照片样式">
        <input type="file" @change="getFile($event)">
        <el-button @click="post()" v-loading.fullscreen.lock="fullscreenLoading">确认上传</el-button>
      </el-form-item>
    </el-form>
    <template #footer>
      <div class="dialog-footer">
        <el-button type="primary" @click="addImg(form)">
          确定
        </el-button>
      </div>
    </template>
  </el-dialog>
</template>


<script>
import axios from "axios";
import img from "@/api/ImgApi.js";
import {ElMessage} from "element-plus";
import commodity from "@/api/CommodityApi.js";

export default {
  el: '#app',
  data: function () {
    return {
      imgName: '',
      imgNameId: '',
      fullscreenLoading: false,
      nowTime: '',
      value1: '',
      value: '',
      options: [],
      dialogFormVisible: false,
      dialogFormVisible1: false,
      form: [],
      tableData: [],
      Commodity: [],
      videoFile: '',
      title: '',
      username: '',
      imgUrl: '',
    }
  },
  created() {
    this.getTimes()
    this.loadImg()
    this.loadCommodity()
  },
  methods: {
    addImg(info){
      // console.log(this.imgName)
      img.add(this.imgUrl,this.imgName).then(res => {
        if (res.code == 200) {
          this.loadImg()
          ElMessage({
            message: '添加成功',
            type: 'success',
          })
        } else {
          ElMessage.error('添加失败')
          this.loadImg()
        }
      });
      this.imgUrl = ''
      this.imgName = ''
      this.form = []
      this.dialogFormVisible1 = false
    },
    queryImg(info) {
      // console.log(info)
      img.query(info).then(res => {
        if (res.code == 200) {
          this.tableData = res.data
          ElMessage({
            message: '查询成功',
            type: 'success',
          })
        } else {
          ElMessage.error('查询失败')
        }
      });
    },
    clean() {
      this.value = ''
      this.form = []
      this.imgName = ''
      this.loadImg()
    },
    updateImg(info) {
      // console.log(info)
      // console.log(this.imgUrl)
      img.update(this.imgUrl, info.commodityImgId).then(res => {
        if (res.code == 200) {
          this.loadImg()
          ElMessage({
            message: '更新成功',
            type: 'success',
          })
        } else {
          ElMessage.error('更新失败')
          this.loadImg()
        }
      });
      this.form = []
      this.imgUrl = ''
      this.dialogFormVisible = false
    },
    openUpdate(info) {
      // console.log(info)
      this.form = []
      this.dialogFormVisible = true
      this.form.commodityImgId = info.commodityImgId
      this.imgName = info.commodityName
    },
    ImgDel(id) {
      // console.log(id)
      img.delete(id).then(res => {
        if (res.code == 200) {
          ElMessage({
            message: '删除成功',
            type: 'success',
          })
          this.loadImg();
        } else {
          ElMessage.error('删除失败')
          this.loadImg();
        }
      });
    },
    openAdd() {
      this.value = ''
      this.form = []
      this.dialogFormVisible1 = true
    },
    loadImg() {
      img.getALL().then((response) => {
        this.tableData = response.data
        // console.log(response.data)
        // console.log(this.tableData)
      }).catch((err) => {
        console.log(err);
      })
    },
//通过此函数将上面上传的文件添加到vue的data内
    getFile(event) {
      this.videoFile = event.currentTarget.files[0];
    },
    post() {
      let params = new FormData()
      params.append('file', this.videoFile)
      this.fullscreenLoading = true
      axios.post('https://picui.cn/api/v1/upload', params,
          {
            headers: {
              'Content-Type': 'multipart/form-data'
            }
          }).then(res => {
        if (res.status == 200) {
          // console.log(res.data.data.links.url)
          this.imgUrl = res.data.data.links.url
          this.fullscreenLoading = false
          ElMessage({
            message: '上传成功',
            type: 'success',
          })
        } else {
          this.fullscreenLoading = false
          ElMessage.error('上传失败')
        }
      });
    },
    getTimes() {
      setInterval(this.getTimesInterval, 1000);
    },
  loadCommodity() {
    commodity.getALL().then((response) => {
      this.Commodity = response.data
      // console.log(response.data)
      // console.log(this.tableData)
    }).catch((err) => {
      console.log(err);
    })
  },
    getTimesInterval: function () {
      let _this = this;
      let year = new Date().getFullYear(); //获取当前时间的年份
      let month = new Date().getMonth() + 1; //获取当前时间的月份
      let day = new Date().getDate(); //获取当前时间的天数
      let hours = new Date().getHours(); //获取当前时间的小时
      let minutes = new Date().getMinutes(); //获取当前时间的分数
      let seconds = new Date().getSeconds(); //获取当前时间的秒数
      //当小于 10 的是时候，在前面加 0
      if (day < 10) {
        day = "0" + day;
      }
      if (month < 10) {
        month = "0" + month;
      }
      if (hours < 10) {
        hours = "0" + hours;
      }
      if (minutes < 10) {
        minutes = "0" + minutes;
      }
      if (seconds < 10) {
        seconds = "0" + seconds;
      }
      //拼接格式化当前时间
      _this.nowTime = year + "-" + month + "-" + day + " " + hours + ":" + minutes + ":" + seconds;
    }
  }
}

</script>