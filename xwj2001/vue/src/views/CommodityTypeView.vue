<template>
  <div class="common-layout">
    <el-container>
      <el-header>
        <el-row :gutter="12">
          <el-col :span="12">
            <el-button plain @click="openAdd">
              新增类型
            </el-button>
          </el-col>
          <el-col :span="12">
            <el-form :model="form" @submit.native.prevent>
              <el-form-item>
                <el-row :gutter="10">
                  <el-col :span="14">
                    <el-input placeholder="请输入名称" v-model="form.commodityTypeName" autocomplete="off"/>
                  </el-col>
                  <el-col :span="5">
                    <el-button type="danger" @click="clean">清空</el-button>
                  </el-col>
                  <el-col :span="5">
                    <el-button type="primary" @click="queryType(form.commodityTypeName)">Query</el-button>
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
        <el-table :data="tableData" Type="height:440px; width: 100%">
          <el-table-column prop="commodityTypeId" label="类型ID"/>
          <el-table-column prop="commodityTypeName" label="类型名称"/>
          <el-table-column label="类型照片" v-slot="Type">
            <el-image :src="Type.row.commodityTypeImgUrl"></el-image>
          </el-table-column>
          <el-table-column prop="commodityTypeAddTime" label="添加时间"/>
          <el-table-column label="操作" width="200" v-slot="scope">
            <el-button plain @click="openUpdate(scope.row)">
              修改
            </el-button>
            <el-popconfirm :title='"你确定要删除&emsp;" + "<" + scope.row.commodityTypeName + ">" + "?"'
                           @confirm='TypeDel(scope.row.commodityTypeId)'>
              <template #reference>
                <el-button>删除</el-button>
              </template>
            </el-popconfirm>
          </el-table-column>
        </el-table>
      </el-main>
    </el-container>
  </div>
  <el-dialog v-model="dialogFormVisible" title="修改类型" width="500">
    <el-form :model="form">
      <el-form-item label="类型名称">
        <el-input v-model="form.commodityTypeName" :placeholder="form.commodityTypeName" autocomplete="off"/>
      </el-form-item>
      <el-form-item label="类型图片">
        <input type="file" @change="getFile($event)">
        <el-button @click="post()" v-loading.fullscreen.lock="fullscreenLoading">确认上传</el-button>
      </el-form-item>
    </el-form>
    <template #footer>
      <div class="dialog-footer">
        <el-button type="primary" @click="updateType(form)">
          确定
        </el-button>
      </div>
    </template>
  </el-dialog>
  <el-dialog v-model="dialogFormVisible1" title="新增类型" width="500">
    <el-form :model="form">
      <el-form-item label="类型名称">
        <el-input v-model="form.commodityTypeName" placeholder="请输入类型名称" autocomplete="off"/>
      </el-form-item>
      <el-form-item label="类型样式">
        <input type="file" @change="getFile($event)">
        <el-button @click="post()" v-loading.fullscreen.lock="fullscreenLoading">确认上传</el-button>
      </el-form-item>
    </el-form>
    <template #footer>
      <div class="dialog-footer">
        <el-button type="primary" @click="addType(form)">
          确定
        </el-button>
      </div>
    </template>
  </el-dialog>
</template>


<script>
import axios from "axios";
import Type from "@/api/TypeApi.js";
import {ElMessage} from "element-plus";

export default {
  el: '#app',
  data: function () {
    return {
      fullscreenLoading: false,
      nowTime: '',
      value: '',
      options: [],
      dialogFormVisible: false,
      dialogFormVisible1: false,
      form: [],
      tableData: [],
      videoFile: '',
      title: '',
      username: '',
      imgUrl: '',
    }
  },
  created() {
    this.getTimes()
    this.loadType();
  },
  methods: {
    queryType(info){
      // console.log(info)
      Type.query(info).then(res => {
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
    clean(){
      this.value = ''
      this.form = []
      this.loadType()
    },
    updateType(info){
      // console.log(info)
      // console.log(this.imgUrl)
      Type.update(info.commodityTypeId,info.commodityTypeName,this.imgUrl).then(res => {
        if (res.code == 200){
          this.loadType();
          ElMessage({
            message: '更新成功',
            type: 'success',
          })
        }
        else {
          ElMessage.error('更新失败')
          this.loadType();
        }
      });
      this.form = []
      this.imgUrl = ''
      this.dialogFormVisible = false
    },
    openUpdate(info){
      this.form = []
      this.dialogFormVisible = true
      this.form.commodityTypeId = info.commodityTypeId
      this.form.commodityTypeName = info.commodityTypeName
    },
    TypeDel(id){
      console.log(id)
      Type.delete(id).then(res => {
        if (res.code == 200) {
          ElMessage({
            message: '删除成功',
            type: 'success',
          })
          this.loadType();
        } else {
          ElMessage.error('删除失败')
          this.loadType();
        }
      });
    },
    openAdd(){
      this.value = ''
      this.form = []
      this.dialogFormVisible1 = true
    },
    loadType(){
      Type.getALL().then((response) => {
        // console.log(response.data)
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
    addType(info){
      // console.log(info.commodityTypeName)
      // console.log(this.nowTime)
      // console.log(this.imgUrl)
      Type.add(info.commodityTypeName,this.imgUrl,this.nowTime).then(res => {
        if (res.code == 200) {
          ElMessage({
            message: '添加成功',
            type: 'success',
          })
          this.loadType();
        } else {
          ElMessage.error('添加失败')
          this.loadType();
        }
      });
      this.dialogFormVisible1 = false
      this.imgUrl = ''
      this.form = []
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