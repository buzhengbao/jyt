hl  <template>
  <el-card style="margin-top: 10px; max-width: 100%;">
  <el-card style="max-width: 100%;">
    <el-row :gutter="12">
      <el-col :span="15">
        <el-button plain @click="dialogFormVisible1 = true">
          新增用户
        </el-button>
      </el-col>
      <el-col :span="9">
        <el-form :model="form" @submit.native.prevent>
          <el-form-item>
            <el-row :gutter="12">
              <el-col :span="20">
                <el-input v-model="form.userName" autocomplete="off"/>
              </el-col>
              <el-col :span="4">
                <el-button type="primary" @click="queryUser(form.userName)">Query</el-button>
              </el-col>
            </el-row>
          </el-form-item>
        </el-form>
      </el-col>
    </el-row>
  </el-card>
  <el-card style="margin-top: 10px; max-width: 100%; height: 500px">
    <el-table :data="tableData" height="450px" style="width: 100%">
      <el-table-column prop="userId" label="用户ID"/>
      <el-table-column prop="userName" label="用户名"/>
      <el-table-column prop="userAccount" label="用户账号"/>
      <el-table-column prop="userRegister" label="用户注册时间"/>
      <el-table-column prop="role" label="用户角色"/>
      <el-table-column prop="state" label="用户状态"/>
      <el-table-column label="操作" width="200" v-slot="scope">
        <el-button plain @click="openUpdate(scope.row)">
          修改
        </el-button>
        <el-popconfirm :title='"你确定要删除" + scope.row.userName + "?"'
                       @confirm='userDel(scope.row.userId)'>
          <template #reference>
            <el-button>删除</el-button>
          </template>
        </el-popconfirm>
      </el-table-column>
    </el-table>

    <el-dialog v-model="dialogFormVisible" title="修改用户信息" width="500">
      <el-form :model="form">
        <el-form-item label="用户ID">
          <el-input disabled v-model="form.userId" autocomplete="off"/>
        </el-form-item>
        <el-form-item label="用户名">
          <el-input disabled v-model="form.userName" autocomplete="off"/>
        </el-form-item>
        <el-form-item label="账&emsp;号">
          <el-input disabled v-model="form.userAccount" autocomplete="off"/>
        </el-form-item>
        <el-form-item label="新密码">
          <el-input type="password" show-password placeholder="请输入新的密码" v-model="form.userPassword"
                    autocomplete="off"/>
        </el-form-item>
        <el-form-item label="角&emsp;色">
          <el-select v-model="js" filterable placeholder="选择角色" style="width: 240px">
            <el-option v-for="item in role" :key="item.value" :label="item.label"
                       :value="item.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="状&emsp;态">
          <el-select v-model="zt" filterable placeholder="选择状态" style="width: 240px">
            <el-option v-for="item in state" :key="item.value" :label="item.label"
                       :value="item.value"
            ></el-option>
          </el-select>
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="updateUser(form)">
            确定
          </el-button>
        </div>
      </template>
    </el-dialog>
    <el-dialog v-model="dialogFormVisible1" title="新增用户" width="500">
      <el-form :model="form">
        <el-form-item label="用户名">
          <el-input v-model="form.name" placeholder="请输入用户名" autocomplete="off"/>
        </el-form-item>
        <el-form-item label="账&emsp;号">
          <el-input v-model="form.account" placeholder="请输入账号" autocomplete="off"/>
        </el-form-item>
        <el-form-item label="密&emsp;码">
          <el-input type="password" show-password placeholder="请输入密码" v-model="form.password" autocomplete="off"/>
        </el-form-item>
        <el-form-item label="角&emsp;色">
          <el-select v-model="js" filterable placeholder="选择角色" style="width: 240px">
            <el-option v-for="item in this.role" :key="item.value" :label="item.label"
                       :value="item.value"
            ></el-option>
          </el-select>
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="addUser(form)">
            确定
          </el-button>
        </div>
      </template>
    </el-dialog>
  </el-card>
  </el-card>
</template>

<script>
import user from "@/api/UserApi.js"
import {ref} from "vue";
import {ElMessage} from "element-plus";
import md5 from 'js-md5';

export default {
  data: function () {
    return {
      role:[
        {
          value: '1',
          label: '管理员',
        },
        {
          value: '2',
          label: '经理',
        },
        {
          value: '3',
          label: '店员',
        }
      ],
      state:[
        {
          value: '1',
          label: '在职',
        },
        {
          value: '2',
          label: '离职',
        }
      ],
      js:'',
      zt:'',
      nowTime: '',
      form: [{
        userId: '',
        userName: '',
        userPassword: '',
        account:'',
      }],
      dialogFormVisible: false,
      dialogFormVisible1: false,
      tableData: []
    }
  },
  created() {
    this.getTimes()
    this.loadUser();
  },
  methods: {
    queryUser(name) {
      // console.log(name)
      user.query(name).then((response) => {
        this.tableData = response.data
        // console.log(response.data)
      }).catch((err) => {
        console.log(err);
      })
    },
    openUpdate(num) {
      // console.log(num)
      this.dialogFormVisible = true
      this.form.userId = num.userId
      this.form.userName = num.userName
      this.form.userAccount = num.userAccount
      // console.log(this.form)
    },
    updateUser(info) {
      console.log(this.js,this.zt)
      this.dialogFormVisible = false
      user.update(info.userId, md5(info.ue
      ),this.js,this.zt).then(res => {
        if (res.code == 200) {
          ElMessage({
            message: '更新成功',
            type: 'success',
          })
          this.loadUser();
        } else {
          ElMessage.error('更新失败')
          this.loadUser();
        }
      });
      this.form = []
      this.zt = ''
      this.js = ''
    },
    loadUser() {
      user.getALL().then((response) => {
        this.tableData = response.data
        // console.log(response.data)
      }).catch((err) => {
        console.log(err);
      })
    },
    userDel(userId) {
      user.delete(userId).then(res => {
        if (res.code == 200) {
          ElMessage({
            message: '删除成功',
            type: 'success',
          })
          this.loadUser();
        } else {
          ElMessage.error('删除失败')
          this.loadUser();
        }
      });
    },
    addUser(info) {
      this.dialogFormVisible1 = false
      // console.log(this.nowTime)
      // console.log(info.name)
      // console.log(md5(info.password))
      user.add(info.name, info.account, md5(info.password),this.js, this.nowTime).then(res => {
        if (res.code == 200) {
          ElMessage({
            message: '添加成功',
            type: 'success',
          })
          this.loadUser();
        } else {
          ElMessage.error('添加失败')
          this.loadUser();
        }
      });
      this.form = []
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
<style>
.infinite-list {
  height: 300px;
  padding: 0;
  margin: 0;
  list-style: none;
}

.infinite-list .infinite-list-item {
  display: flex;
  align-items: center;
  justify-content: center;
  height: 50px;
  background: var(--el-color-primary-light-9);
  //margin: 10px;
  color: var(--el-color-primary);
}

.infinite-list .infinite-list-item + .list-item {
  //margin-top: 10px;
}
</style>