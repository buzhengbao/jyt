import './assets/main.css'

import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import ElementPlus from 'element-plus'
import 'element-plus/dist/index.css'
import mockjs from 'mockjs'
import Cookies from "js-cookie"
const app = createApp(App)
import * as Icons from '@element-plus/icons-vue' // 引入所有图标，并命名为 Icons

//添加全局前置导航守卫
router.beforeEach((to,from,next)=>{
    //判断token存在吗？
    const user = localStorage.getItem('user')
    // console.log(JSON.parse(user).token)
    // const token = JSON.parse(user).token
    const token=Cookies.get('token')
    if (!token && !user && to.name !== 'login'){
        next({name:'login'})
    }else if(user && to.name === 'login'){
        //token存在跳转到后台
        next({name:'home'})
    }else{
        next()
    }
})



for (let i in Icons) {
    app.component(i, Icons[i])
}
app.use(router)
app.use(mockjs)
app.use(ElementPlus)
app.mount('#app')
