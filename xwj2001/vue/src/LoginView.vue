<template>
  <div class="houtai">
    <el-container>
      <el-main>
        <el-card>
          <el-space fill wrap fill-ratio=50 direction=vertical style="width: 100% ;height: 70vh;">
            <el-card style="width: 50%;height: 100%;">
              <div :xl="6" :lg="7" class="bg-login">
                <!--标题-->
                <div style="text-align: center;">
                  <h2>登录</h2>
                </div>
                <!--form表单-->
                <el-row class="row-bg card" justify="center" align="bottom">
                  <el-card style="height: 170px;background-color: #ffffff8f;">
                    <!--loginForm-->
                    <div id="login">
                      <el-form ref="form" :model="form" label-width="30%">
                        <el-form-item label="用户名:" style="color: #000;">
                          <el-input v-model="form.username"></el-input>
                        </el-form-item>
                        <el-form-item label="密  码:">
                          <el-input v-model="form.password" type="password"></el-input>
                        </el-form-item>
                      </el-form>
                      <el-button type="primary" round @click="login" class="btn"
                                 style="padding: 8px 15px;position: absolute;left: 290px;">登录
                      </el-button>
                    </div>
                  </el-card>
                </el-row>
              </div>
            </el-card>
          </el-space>
        </el-card>
      </el-main>
    </el-container>
  </div>
</template>


<style>
.houtai {
  padding: 10px;
}

a {
  text-decoration: none;
}

.router-link-active {
  text-decoration: none;
}

.codeImg {
  /*让验证码图片飘在右边*/
  float: right;
  /*设置一些圆角边框*/
  border-radius: 3px;
  /*设置宽度*/
  width: 26%;
}

.bg-login {
  height: 100%;
  background-size: 200%;

}

.btn-ground {
  text-align: center;
}

.logo {
  margin: 30px;
  height: 70px;
  width: 70px;
  position: fixed;
}

.title {
  text-shadow: -3px 3px 1px #5f565e;
  text-align: center;
  margin-top: 60%;
  color: #41b9a6;
  font-size: 40px;
}

.login-card {
  background-color: #ffffff;
  opacity: 0.9;
  box-shadow: 0 0 20px #ffffff;
  border-radius: 10px;
  padding: 40px 40px 30px 15px;
  width: auto;
}
</style>


<script>
import user from "@/api/UserApi.js"
import Mock from 'mockjs'
import Cookie from 'js-cookie'
import md5 from 'js-md5';

export default {
  data() {
    return {
      info: {},
      form: {
        username: '',
        password: ''
      }
    };
  },

  methods: {
    login() {
      const token = Mock.Random.guid()
      if (this.form.username == '') {
        this.$message.error('用户名不能为空');
      } else if (this.form.password == '') {
        this.$message.error('密码不能为空');
      } else {
        user.login(this.form.username,md5(this.form.password)).then(res => {
          // console.log(res.data)
          if (res.data.length !== 0) {
            if (res.data.userPassword === md5(this.form.password) &&
                res.data.userRoleId === 1 &&
                res.data.userStateId === 1) {
              this.$message.success('登录成功');
              this.info = res.data
              localStorage.setItem("user", JSON.stringify(res.data))
              this.$router.push('/')
            } else {
              this.$alert('密码错误或者无权限', '登录失败', {
                confirmButtonText: '确定',
                callback: action => {
                  this.form.username = ''
                  this.form.password = ''
                }
              });
            }
          } else {
            this.$alert('用户名错误', '登录失败', {
              confirmButtonText: '确定',
              callback: action => {
                this.form.username = '',
                    this.form.password = ''
              }
            });
          }
        }).catch(err => {
          console.log("登录失败" + err);
        })
      }
    },
  }
}


</script>
