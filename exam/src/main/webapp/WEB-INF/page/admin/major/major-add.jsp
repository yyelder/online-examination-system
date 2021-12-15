<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>专业添加</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${basePath}/lib/layui-v2.5.5/css/layui.css" media="all">
    <link rel="stylesheet" href="${basePath}/css/public.css" media="all">
    <style>
        body {
            background-color: #ffffff;
        }
        .layui-input{
            width: 250px !important;
        }
    </style>
</head>
<body>
<div class="layui-form layuimini-form">
    <div class="layui-form-item">
        <label class="layui-form-label required">专业</label>
        <div class="layui-input-block">
            <input type="text" name="name" id="name" lay-verify="required" lay-reqtext="专业不能为空" placeholder="请输入专业" value="" class="layui-input">
            <tip>填写专业名称。</tip>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn layui-btn-normal" lay-submit lay-filter="saveBtn">确认保存</button>
        </div>
    </div>
</div>
<script src="${basePath}/lib/layui-v2.5.5/layui.js" charset="utf-8"></script>
<script>
    layui.use(['jquery','form'], function () {
        var form = layui.form,
            layer = layui.layer,
            $ = layui.jquery;

        //监听提交
        form.on('submit(saveBtn)', function (data) {
            $.ajax({
                type:"POST",
                url:"${basePath}/admin/major/add/do",
                data:data.field,
                dataType:"text",
                success:function(data){
                    if(data=='ok'){
                        layer.msg("添加成功",{time:1000},function(){//time单位是毫秒
                            //刷新页面
                            window.location.reload();
                        });
                    }else if(data=='no'){
                        layer.alert("专业名称重复，请重新输入",function(index){
                            $("#name").focus();
                            layer.close(index);
                        })
                    }else{
                        layer.alert("添加失败");
                    }
                }
            });
            //关闭添加窗口
            //var iframeIndex = parent.layer.getFrameIndex(window.name);
            //parent.layer.close(iframeIndex);
            return false;
        });

    });
</script>
</body>
</html>