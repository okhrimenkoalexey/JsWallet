require! {
    \react
    \../get-primary-info.ls
    \../get-lang.ls
}
.confirmation
    @import scheme
    position: absolute
    z-index: 99999999
    height: 100vh
    top: 0
    left: 0
    width: 100%
    box-sizing: border-box
    >.confirmation-body
        background: white
        text-align: center
        position: fixed
        width: 100%
        input
            border-radius: $border
            height: 36px
            width: 90px
            line-height: 36px
            text-align: center
            font-size: 13px
            outline: none
        >.header
            padding: 15px 0 0
            font-size: 17px
            font-weight: bold
            margin-bottom: 10px
        >.text
            padding: 10px
            input
                border-radius: $border
        >.buttons
            text-align: center
            >.button
                display: inline-block
                cursor: pointer
                height: 36px
                width: 90px
                font-weight: bold
                font-size: 10px
                text-transform: uppercase
                border-radius: $border
                border: 1px solid #CCC
                margin: 15px 5px
                padding: 0px 6px
                background: transparent
                text-overflow: ellipsis
                overflow: hidden
                white-space: nowrap
alert-modal = (store)->
    return null if typeof! store.current.alert isnt \String
    cancel = ->
        store.current.alert = no
        callback = state.callback
        state.callback = null
        callback no if typeof! callback is \Function
    style = get-primary-info store
    confirmation-style =
        background: style.app.background
        color: style.app.text
    confirmation-style2 =
        color: style.app.text
    button-style=
        color: style.app.text
    confirmation=
        background: style.app.background
        color: style.app.text
        border-bottom: "1px solid #{style.app.border}"
    lang = get-lang store
    .pug.confirmation
        .pug.confirmation-body(style=confirmation)
            .pug.header(style=confirmation-style) Alert
            .pug.text(style=confirmation-style2) #{store.current.alert}
            .pug.buttons
                button.pug.button(on-click=cancel style=button-style) #{lang.cancel}
confirmation-modal = (store)->
    return null if typeof! store.current.confirmation isnt \String
    confirm = ->
        store.current.confirmation = yes
        callback = state.callback
        state.callback = null
        callback yes if typeof! callback is \Function
    cancel = ->
        store.current.confirmation = no
        callback = state.callback
        state.callback = null
        callback no if typeof! callback is \Function
    style = get-primary-info store
    confirmation-style =
        background: style.app.background
        color: style.app.text
    confirmation-style2 =
        color: style.app.text
    button-style=
        color: style.app.text
    confirmation=
        background: style.app.background
        color: style.app.text
        border-bottom: "1px solid #{style.app.border}"
    lang = get-lang store
    .pug.confirmation
        .pug.confirmation-body(style=confirmation)
            .pug.header(style=confirmation-style) #{lang.confirmation}
            .pug.text(style=confirmation-style2) #{store.current.confirmation}
            .pug.buttons
                button.pug.button(on-click=confirm style=button-style) #{lang.confirm}
                button.pug.button(on-click=cancel style=button-style) #{lang.cancel}
prompt-modal = (store)->
    return null if typeof! store.current.prompt isnt \String
    confirm = ->
        store.current.prompt = yes
        callback = state.callback
        state.callback = null
        callback store.current.prompt-answer if typeof! callback is \Function
        store.current.prompt-answer = ""
    cancel = ->
        store.current.prompt = no
        callback = state.callback
        state.callback = null
        callback null if typeof! callback is \Function
        store.current.prompt-answer = ""
    change-input = (e)->
        store.current.prompt-answer = e.target.value
    style = get-primary-info store
    confirmation-style =
        background: style.app.background
        color: style.app.text
    input-style =
        background: style.app.wallet
        color: style.app.text
        border: "0"
    button-style=
        color: style.app.text
    confirmation=
        background: style.app.background
        color: style.app.text
        border-bottom: "1px solid #{style.app.border}"
    lang = get-lang store
    .pug.confirmation
        .pug.confirmation-body(style=confirmation)
            .pug.header(style=style=confirmation-style) #{lang.confirmation}
            .pug.text(style=style=confirmation-style) #{store.current.prompt}
            .pug
                input.pug(on-change=change-input value="#{store.current.prompt-answer}" style=input-style)
            .pug.buttons
                button.pug.button(on-click=confirm style=button-style) #{lang.confirm}
                button.pug.button(on-click=cancel style=button-style) #{lang.cancel}
export confirmation-control = (store)->
    .pug
        confirmation-modal store
        prompt-modal store
        alert-modal store
state=
    callback: null
export confirm = (store, text, cb)->
    store.current.confirmation = text
    state.callback = cb
export prompt = (store, text, cb)->
    store.current.prompt = text
    state.callback = cb
export alert = (store, text, cb)->
    store.current.alert = text
    state.callback = cb