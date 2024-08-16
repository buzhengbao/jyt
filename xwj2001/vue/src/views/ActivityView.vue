<template>
  <div class="common-layout">
    <el-container>
      <el-header>
        <el-row :gutter="12">
          <el-col :span="12">
            <el-button plain @click="openAdd">
              新增活动
            </el-button>
          </el-col>
          <el-col :span="12">
            <el-form :model="form" @submit.native.prevent>
              <el-form-item>
                <el-row :gutter="10">
                  <el-col :span="9">
                    <div class="block">
                      <el-date-picker
                          v-model="selectTime1"
                          type="datetime"
                          placeholder="Select date and time"
                          style="max-width: 200px"
                      />
                    </div>
                  </el-col>
                  <el-col :span="9">
                    <el-input placeholder="请输入名称" v-model="form.ActivityName" autocomplete="off"/>
                  </el-col>
                  <el-col :span="3">
                    <el-button type="danger" @click="clean">清空</el-button>
                  </el-col>
                  <el-col :span="3">
                    <el-button type="primary" @click="queryAcivity(form.ActivityName)">Query</el-button>
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
          <el-table-column prop="activityId" label="活动ID"/>
          <el-table-column prop="activityName" label="活动名称"/>
          <el-table-column label="活动海报" v-slot="scope">
            <el-image :src="scope.row.activityImgUrl"></el-image>
          </el-table-column>
          <el-table-column prop="activityBeginTime" label="开始时间"/>
          <el-table-column prop="activityEndTime" label="结束时间"/>
          <el-table-column prop="activityAddTime" label="添加时间"/>
          <el-table-column label="操作" width="200" v-slot="scope">
            <el-button plain @click="openUpdate(scope.row)">
              修改
            </el-button>
            <el-popconfirm :title='"你确定要删除&emsp;" + "<" + scope.row.activityName + ">" + "?"'
                           @confirm='ActivityDel(scope.row.activityId)'>
              <template #reference>
                <el-button>删除</el-button>
              </template>
            </el-popconfirm>
          </el-table-column>
        </el-table>
      </el-main>
    </el-container>
  </div>
  <el-dialog v-model="dialogFormVisible" title="修改活动" width="500">
    <el-form :model="form">
      <el-form-item label="活动名称">
        <el-input v-model="form.ActivityName" autocomplete="off"/>
      </el-form-item>
      <el-form-item label="活动海报">
        <input type="file" @change="getFile($event)">
        <el-button @click="post()" v-loading.fullscreen.lock="fullscreenLoading">确认上传</el-button>
      </el-form-item>
      <el-form-item label="起止时间">
        <div class="block">
          <el-date-picker
              v-model="selectTime"
              type="datetimerange"
              start-placeholder="Start date"
              end-placeholder="End date"
              format="YYYY-MM-DD HH:mm:ss"
              value-format="YYYY-MM-DD HH:mm:ss"
              date-format="YYYY/MM/DD ddd"
              time-format="A hh:mm:ss"
              style="max-width: 380px"
          />
        </div>
      </el-form-item>
    </el-form>
    <template #footer>
      <div class="dialog-footer">
        <el-button type="primary" @click="updateActivity(form)">
          确定
        </el-button>
      </div>
    </template>
  </el-dialog>
  <el-dialog v-model="dialogFormVisible1" title="新增活动" width="500">
    <el-form :model="form">
      <el-form-item label="活动名称">
        <el-input v-model="form.ActivityName" placeholder="请输入活动名称" autocomplete="off"/>
      </el-form-item>
      <el-form-item label="活动海报">
        <input type="file" @change="getFile($event)">
        <el-button @click="post()" v-loading.fullscreen.lock="fullscreenLoading">确认上传</el-button>
      </el-form-item>
      <el-form-item label="起止时间">
        <div class="block">
          <el-date-picker
              v-model="selectTime"
              type="datetimerange"
              start-placeholder="Start date"
              end-placeholder="End date"
              format="YYYY-MM-DD HH:mm:ss"
              value-format="YYYY-MM-DD HH:mm:ss"
              date-format="YYYY/MM/DD ddd"
              time-format="A hh:mm:ss"
              style="max-width: 380px"
          />
        </div>
      </el-form-item>
    </el-form>
    <template #footer>
      <div class="dialog-footer">
        <el-button type="primary" @click="addActivity(form)">
          确定
        </el-button>
      </div>
    </template>
  </el-dialog>
</template>


<script>
import axios from "axios";
import activity from "@/api/ActivityApi.js";
import {ElMessage} from "element-plus";

export default {
  el: '#app',
  data: function () {
    return {
      selectTime1: '',
      selectTime: '',
      activityBeginTime: '',
      activityEndTime: '',
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
    this.loadActivity();
  },
  methods: {
    queryAcivity(info){
      console.log(this.selectTime)
      activity.query(info,this.selectTime1).then(res => {
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
      this.loadActivity()
      this.selectTime = ''
    },
    updateActivity(info){
      // console.log(info)
      // console.log(this.imgUrl)
      activity.update(info.ActivityId,info.ActivityName,this.imgUrl,this.selectTime[0],this.selectTime[1]).then(res => {
        if (res.code == 200){
          ElMessage({
            message: '更新成功',
            type: 'success',
          })
          this.loadActivity();
        }
        else {
          ElMessage.error('更新失败')
          this.loadActivity();
        }
      });
      this.form = []
      this.imgUrl = ''
      this.dialogFormVisible = false
    },
    openUpdate(info){
      this.selectTime = ''
      this.dialogFormVisible = true
      console.log(info)
      this.form.ActivityId = info.activityId
      this.form.ActivityName = info.activityName
    },
    ActivityDel(id){
      console.log(id)
      activity.delete(id).then(res => {
        if (res.code == 200) {
          ElMessage({
            message: '删除成功',
            type: 'success',
          })
          this.loadActivity();
        } else {
          ElMessage.error('删除失败')
          this.loadActivity();
        }
      });
    },
    openAdd(){
      this.selectTime = ''
      this.value = ''
      this.form = []
      this.dialogFormVisible1 = true
    },
    loadActivity(){
      activity.getALL().then((response) => {
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
    addActivity(info){
      // console.log(this.selectTime[0])
      // console.log(info.ActivityName)
      // console.log(this.nowTime)
      // console.log(this.imgUrl)
      activity.add(info.ActivityName,this.imgUrl,this.selectTime[0],this.selectTime[1],this.nowTime).then(res => {
        if (res.code == 200) {
          ElMessage({
            message: '添加成功',
            type: 'success',
          })
          this.loadActivity();
        } else {
          ElMessage.error('添加失败')
          this.loadActivity();
        }
      });
      this.dialogFormVisible1 = false
      this.imgUrl = ''
      this.form = []
      this.selectTime = ''
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