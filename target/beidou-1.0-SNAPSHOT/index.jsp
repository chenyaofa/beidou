<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<h2>Hello World!</h2>
<div>
    <div class="login_wrapper">
        <div class="animate form login_form">
            <section style="align-content: center">
                <form action="user/denglu" method="post">
                    <h1>订单管理系统</h1>
                    <div>
                        <input type="text" class="form-control" name="usernameOruserman" placeholder="请输入用户名" required="" />
                    </div>
                    <div>
                        <input type="password" class="form-control" name="password" placeholder="请输入密码" required="" />
                    </div>
                    <span>${error }</span>
                    <div>
                        <button type="submit" class="btn btn-success">登     录</button>
                        <button type="reset" class="btn btn-default">重　填</button>
                    </div>
                </form>
            </section>
        </div>
    </div>
</div>
</body>
</html>
