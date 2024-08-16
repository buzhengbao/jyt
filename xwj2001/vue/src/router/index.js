import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import Cookies from "js-cookie";

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: HomeView
    },
    {
      path: '/user',
      name: 'user',
      // route level code-splitting
      // this generates a separate chunk (About.[hash].js) for this route
      // which is lazy-loaded when the route is visited.
      component: () => import('../views/UserView.vue')
    },
    {
      path: '/login',
      name: 'login',
      // route level code-splitting
      // this generates a separate chunk (About.[hash].js) for this route
      // which is lazy-loaded when the route is visited.
      component: () => import('../LoginView.vue')
    },
    {
      path: '/goodsMenu',
      name: 'goodsMenu',
      // route level code-splitting
      // this generates a separate chunk (About.[hash].js) for this route
      // which is lazy-loaded when the route is visited.
      component: () => import('../views/GoodsMenuView.vue'),
      children:[ // 嵌套子路由
          {
            path:'/goodsMenu', // 子页面1
            component: () => import('../views/GoodsView.vue'),
          },
          {
            path:'/goodsMenu/commodityStyle', // 子页面2
            component: () => import('../views/CommodityStyleView.vue'),
          },
        {
          path:'/goodsMenu/commodityType', // 子页面2
          component: () => import('../views/CommodityTypeView.vue'),
        },
        {
          path:'/goodsMenu/activity', // 子页面2
          component: () => import('../views/ActivityView.vue'),
        },
        {
          path:'/goodsMenu/commodityTag', // 子页面2
          component: () => import('../views/TagView.vue'),
        },
        {
          path:'/goodsMenu/commodityImg', // 子页面2
          component: () => import('../views/CommodityImgView.vue'),
        },
        {
          path:'/goodsMenu/commodityTagList', // 子页面2
          component: () => import('../views/CommodityTagListView.vue'),
        },
        {
          path:'/goodsMenu/order', // 子页面2
          component: () => import('../views/OrderView.vue'),
        },
        {
          path:'/goodsMenu/log', // 子页面2
          component: () => import('../views/LogView.vue'),
        },
        ]
    },
      //子目录路由
    // {
    //   path: '/home', // 主页路由
    //   name: 'Home',
    //   component: Home,
    //   children:[ // 嵌套子路由
    //     {
    //       path:'one', // 子页面1
    //       component:One
    //     },
    //     {
    //       path:'two', // 子页面2
    //       component:Two
    //     },
    //   ]
    // }
  ]

})


export default router
