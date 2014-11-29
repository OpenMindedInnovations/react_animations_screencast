{div, p, h1, a, ul, li} = React.DOM

HomePage = React.createClass
  mixins: [tweenState.Mixin]

  getInitialState: ->
    left: -500

  toggleSidebar: ->
    @tweenState 'left',
      easing: tweenState.easingTypes.easeInOutQuad
      duration: 500
      endValue: (if @state.left is 0 then -500 else 0)

  render: ->
    style =
      position: "fixed"
      zIndex: '10'
      width: 500
      top: 0
      bottom: 0
      left: @getTweeningValue('left')
      backgroundColor: '#3b3b3b'
      boxShadow: '1px 1px 3px rgba(0,0,0,.25)'

    div {},
      div className: 'sidebar', style: style,
        h1 className: 'menu-title', 'Awesome Menu'
        ul className: 'menu list-unstyled',
          li {}, 
            a href: 'https://www.youtube.com/watch?v=iul1fWHVU6A', 'React Animations Screencast'

          li {}, 
            a href: 'https://www.youtube.com/watch?v=iul1fWHVU6A', 'Backbone React Screencast'

          li {}, 
            a href: 'http://facebook.github.io/react/', 'React'

          li {}, 
            a href: 'https://github.com/magalhas/backbone-react-component', 'Backbone React Component'

          li {}, 
            a href: 'http://www.openmindedinnovations.com/', 'Open Minded Innovations'

          li {}, 
            a href: 'https://github.com/chenglou/react-tween-state', 'React Tween State'

      div className: 'container',
        div className: 'row',
          div className: 'col-xs-12',
            div className: 'jumbotron',
              h1 className: 'text-center', 'React Animations!'
              p className: 'text-center',
                'This is an '
                a href: 'http://www.openmindedinnovations.com', target: '_blank', 'Open Minded Innvoations'
                ' screencast that uses the '
                a href: 'https://github.com/chenglou/react-tween-state', target: '_blank', 'react-tween-state'
                ' library.'
              div className: 'row',
                div className: 'col-xs-4 col-xs-offset-4',
                  a onClick: @toggleSidebar, className: 'btn btn-primary btn-lg btn-block', href:"#", 'Toggle Sidebar'


HomePage = React.createFactory(HomePage)

React.render HomePage(), document.getElementById('home-page-wrapper')