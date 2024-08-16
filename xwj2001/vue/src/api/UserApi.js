import axiosUtils from "@/utils/axiosUtils"
class user{
    getALL()
    {
        return axiosUtils.get('http://127.0.0.1:2001/api/getUser')
    }
    getLogin(userAccount)
    {
        return axiosUtils.get('http://127.0.0.1:2001/api/getLogin/'+userAccount)
    }

    login(userAccount,userPassword)
    {
        return axiosUtils.postForm('http://127.0.0.1:2001/api/login', {userAccount:userAccount,userPassword:userPassword})
    }
    add(username,userAccount,userPassword,userRoleId,userRegister)
    {
        return axiosUtils.postForm('http://127.0.0.1:2001/api/addUser', {userName:username,userAccount:userAccount,userPassword:userPassword,userRoleId:userRoleId,userRegister:userRegister})
    }
    update(userId,userPassword,userRoleId,userStateId)
    {
        return axiosUtils.postForm('http://127.0.0.1:2001/api/updateUser', {userId:userId,userPassword:userPassword,userRoleId:userRoleId,userStateId:userStateId})
    }
    query(userName){
        return axiosUtils.get('http://127.0.0.1:2001/api/getUserName/'+userName)
    }
    delete(userId)
    {
        return axiosUtils.get('http://127.0.0.1:2001/api/deleteUserById/'+userId)
    }
}

export default new user();