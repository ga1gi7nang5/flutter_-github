import '../export.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController _nameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  // 密码是否明文显示
  bool passwordShow = false;
  GlobalKey _formKey = new GlobalKey<FormState>();
  bool _nameAutoFocus = false;
  bool _isLoginBtnDisabled = true;


  @override
  void initState() {
    _nameController.text = Global.profile.lastLogin;
    print(_nameController.text != null);
    if (_nameController.text != null) {
      _nameAutoFocus = true;
    }
    super.initState();
  }

  void _onLogin() async {
    if ((_formKey.currentState as FormState).validate()) {
      showLoading(context);
    }
  }

  VoidCallback _getLoginClickListener() {
    if (_isLoginBtnDisabled) {
      return null;
    } else {
      return _onLogin;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('登录'),),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          autovalidate: true,
          child: Padding(
            padding: EdgeInsets.only(top: ScreenUtil().setWidth(52), left: ScreenUtil().setWidth(28), right: ScreenUtil().setWidth(28)),
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _nameController,
                  autofocus: _nameAutoFocus,
                  decoration: InputDecoration(
                    hintText: '登录邮箱',
                  ),
                  validator: (v) {
                    return v.trim().isNotEmpty ? null : '登录邮箱不能为空';
                  }
                ),
                Container(
                  height: ScreenUtil().setWidth(26),
                ),
                TextFormField(
                    controller: _passwordController,
                    autofocus: !_nameAutoFocus,
                    decoration: InputDecoration(
                      hintText: '密码',
                      suffixIcon: IconButton(
                        icon: Icon(passwordShow ? Icons.visibility_off : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            passwordShow = !passwordShow;
                          });
                        },
                      )
                    ),
                    validator: (v) {
                      return v.trim().isNotEmpty ? null : '登录密码不能为空';
                    }
                ),
                Container(
                  margin: EdgeInsets.only(top: ScreenUtil().setWidth(72)),
                  width: double.infinity,
                  height: ScreenUtil().setWidth(90),
                  child: FlatButton(
                    onPressed: _getLoginClickListener(),
                    color: Color(0xff28a745),
                    disabledColor: Color(0xff69bf7d),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setWidth(90) / 2))),
                    child: Text('登录', style: TextStyle(color: Color(0xff0d1917), fontSize: ScreenUtil().setSp(30)),),
                  )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}