<template>
  <el-menu
      default-active="1"
      style="width: 100%;
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  height: 50px;
  text-align: center;
  z-index: 3;"
      class="el-menu-demo"
      mode="horizontal"
      :ellipsis="false"
  >
    <el-menu-item index="0">
      <h2>聚雅堂</h2>
    </el-menu-item>
    <div class="flex-grow"/>
    <el-menu-item index="1">
      <RouterLink to="/home">
        <el-icon>
          <House/>
        </el-icon>
        首页
      </RouterLink>
    </el-menu-item>
    <el-menu-item index="2">
      <RouterLink to="/user">
        <el-icon>
          <User/>
        </el-icon>
        用户管理
      </RouterLink>
    </el-menu-item>
    <el-menu-item index="3">
      <RouterLink to="/goodsMenu">
        <el-icon>
          <MessageBox/>
        </el-icon>
        商品管理
      </RouterLink>
    </el-menu-item>
    <el-sub-menu index="4">
      <template #title>{{ user.userName }}</template>
      <el-menu-item index="2-1">
        <el-button type="danger" @click="logut">
          <el-icon>
            <SwitchButton/>
          </el-icon>
          退出
        </el-button>
      </el-menu-item>
    </el-sub-menu>
  </el-menu>
  <RouterView/>
</template>

<script>
import Cookie from "js-cookie";
import {ElMessage} from "element-plus";

export default {
  beforeCreate() {
    localStorage.getItem("user")
  },
  data() {
    return {
      routerAlive:true,
      user: localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")) : {}
    }
  },
  methods: {
    logut() {
      console.log("退出")
      Cookie.remove('token')
      localStorage.removeItem("user")
      this.user = {}
      ElMessage.success({
        message: "退出成功",
        type: 'success',
      })
      this.$router.push({
        path: '/login',
      })
    }
  }
}
</script>

<style>
.flex-grow {
  flex-grow: 1;
}

.el-menu-demo {
  width: 100%;
  position: fixed;
  top: 0;
  height: 50px;
  text-align: center;
  z-index: 3;
}
</style>
<!--        <RouterLink to="/">Home</RouterLink>-->
<!--        <RouterLink to="/about">About</RouterLink>-->