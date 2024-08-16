import axiosUtils from "@/utils/axiosUtils"
class Activity{
    getALL()
    {
        return axiosUtils.get('http://127.0.0.1:2001/api/getActivity')
    }
    getCount()
    {
        return axiosUtils.get('http://127.0.0.1:2001/api/getActivityCount')
    }
    add(activityName,activityImgUrl,activityBeginTime,activityEndTime,activityAddTime)
    {
        return axiosUtils.postForm('http://127.0.0.1:2001/api/addActivity', {activityName:activityName,activityImgUrl:activityImgUrl,activityBeginTime:activityBeginTime,activityEndTime:activityEndTime,activityAddTime:activityAddTime})
    }
    update(activityId,activityName,activityImgUrl,activityBeginTime,activityEndTime)
    {
        return axiosUtils.postForm('http://127.0.0.1:2001/api/updateActivity', {activityId:activityId,activityName:activityName,activityImgUrl:activityImgUrl,activityBeginTime:activityBeginTime,activityEndTime:activityEndTime})
    }
    query(activityName,activityBeginTime){
        return axiosUtils.postForm('http://127.0.0.1:2001/api/getActivityName/', {activityName:activityName,activityBeginTime:activityBeginTime})
    }
    delete(activityId)
    {
        return axiosUtils.get('http://127.0.0.1:2001/api/deleteActivityById/'+activityId)
    }
}

export default new Activity();