(window.webpackJsonp=window.webpackJsonp||[]).push([[8],{L9NX:function(U,c,e){"use strict";e.r(c);var h=e("UjKZ"),O=e("/12L"),v=e("0ZRi"),p=e("sk+B"),D=e("xwgP"),l=e.n(D),M=e("QlQ+"),g=e("q5+0"),P=e("9kvl"),E=e("XuRK"),L=e.n(E),f=function(o){Object(v.a)(n,o);var u=Object(p.a)(n);function n(){var a;Object(h.a)(this,n);for(var _=arguments.length,r=new Array(_),t=0;t<_;t++)r[t]=arguments[t];return a=u.call.apply(u,[this].concat(r)),a.state={isReady:!1},a}return Object(O.a)(n,[{key:"componentDidMount",value:function(){var _=this,r=this.props.dispatch,t=this.props,m=t.children,s=t.loading,i=t.currentUser;s||setTimeout(function(){_.setState({isReady:!0})},0);var d=i&&i.id;r&&!d&&r({type:"user/fetchCurrent"})}},{key:"render",value:function(){var _=this.state.isReady,r=this.props,t=r.children,m=r.loading,s=r.currentUser,i=s&&s.id,d=Object(E.stringify)({redirect:window.location.href});return!i&&m||!_||!s.loaded?l.a.createElement(M.a,null):!i&&window.location.pathname!=="/user/login"?l.a.createElement(g.c,{to:"/user/login?".concat(d)}):t}}]),n}(l.a.Component);c.default=Object(P.b)(function(o){var u=o.user,n=o.loading;return{currentUser:u.currentUser,loading:n.models.user}})(f)}}]);