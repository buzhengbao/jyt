import axiosUtils from "@/utils/axiosUtils"
class TagList{
    getALL()
    {
        return axiosUtils.get('http://127.0.0.1:2001/api/getTagList')
    }
    add(commodityId,commodityTagId)
    {
        return axiosUtils.postForm('http://127.0.0.1:2001/api/addTagList', {commodityId:commodityId,commodityTagId:commodityTagId})
    }
    update(commodityTagId,commodityTagListId)
    {
        return axiosUtils.postForm('http://127.0.0.1:2001/api/updateTagList', {commodityTagId:commodityTagId,commodityTagListId:commodityTagListId})
    }
    query(commodityTagName){
        return axiosUtils.postForm('http://127.0.0.1:2001/api/getTagListName/', {commodityTagName:commodityTagName})
    }
    delete(commodityTagListId)
    {
        return axiosUtils.get('http://127.0.0.1:2001/api/deleteTagListById/'+commodityTagListId)
    }
}

export default new TagList();