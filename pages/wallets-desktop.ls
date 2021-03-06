require! {
    \react
    \./wallet.ls
    \prelude-ls : { map, take, drop }
    \./menu.ls
    \../seed.ls : { get }
    \../web3.ls
    \../wallets-funcs.ls
    \./manage-account.ls
    \./token-migration.ls
    \./add-coin.ls : add-coin-page
    \../get-lang.ls
    \../get-primary-info.ls
    \./history.ls
    \./your-account.ls
    \./icon.ls
    \localStorage
}
.wallets
    @import scheme
    $real-height: 300px
    $cards-height: 296px
    $pad: 20px
    $radius: 15px    
    height: auto
    box-sizing: border-box
    position: relative
    left: 0
    bottom: 0
    $cards-pad: 15px
    right: 0
    z-index: 2
    .header 
        &:after
            position: absolute
            font-weight: bold
            font-size: 40px
            opacity: .05
            top: 20px
            left: -5px
    .switch-account
        float: right
        line-height: 2
        right: 80px
        position: relative
        display: inline-flex
        .name
            text-overflow: ellipsis
            white-space: nowrap
            overflow: hidden
            width: 110px
            text-align: right
        input
            outline: none
            width: 100px
            margin-top: -6px
            height: 36px
            line-height: 36px
            border-radius: 0px
            padding: 0px 10px
            font-size: 12px
            opacity: 1
        span
            cursor: pointer
        .icon
            vertical-align: middle
            margin-left: 20px
    .h1
        font-size: 12px
        text-transform: uppercase
        letter-spacing: 2px
        opacity: .8
    .your-account
        position: absolute
        width: auto
        display: inline-block
        right: 0
        top: 0
        padding: 12px 20px
        border-left: 1px solid #6b258e
        .buttons
            >.button
                width: 20px
                padding: 0
                outline: none
    >*
        width: 100%
    >.arrow
        position: absolute
        text-align: center
        cursor: pointer
        &.arrow-t
            top: 0
            margin-top: 10px
        &.arrow-d
            bottom: 0
            margin-bottom: 10px
            transform: rotate(180deg)
        &:not(.true)
            >.arrow-d
                visibility: hidden
        >.arrow-container
            display: inline-block
            width: 100%
            max-width: 450px
            position: relative
    >.wallet-container
        overflow: hidden
        overflow-y: auto
        height: 300px
        width: 100%
        border-top: 1px solid #213040
        display: inline-block
mobile = ({ store, web3t })->
    return null if not store.current.account?
    { wallets, go-up, can-up, go-down, can-down } = wallets-funcs store, web3t
    style = get-primary-info store
    lang = get-lang store
    border-style =
        border-top: "1px solid #{style.app.border}"
    row =
        display: "flex"
        height: "100vh"
        margin-left: "60px"
    left-side =
        width: "45%"
    right-side =
        width: "55%"
        border-left: "1px solid #{style.app.border}"
    header-style =
        border-top: "1px solid #{style.app.border}"
        padding: "17px 0px 20px"
        color: style.app.text
        text-align: "left"
    input=
        background: style.app.wallet
        border: "1px solid #{style.app.border}"
        color: style.app.text
    header-left =
        margin-left: "10px"
    border-right=
        border-right: "1px solid #{style.app.border}"
    open-account = ->
        store.current.switch-account = not store.current.switch-account
    edit-account-name = ->
        store.current.edit-account-name = current-account-name!
    default-account-name = -> "Account #{store.current.account-index}"
    edit-account = (e)->
        #console.log e
        store.current.edit-account-name = e.target.value
    done-edit = ->
        local-storage.set-item default-account-name!, store.current.edit-account-name
        cancel-edit-account-name!
    cancel-edit-account-name = ->
        store.current.edit-account-name = ""
    current-account-name = ->
        local-storage.get-item(default-account-name!) ? default-account-name!
    account-name = current-account-name!
    view-account-template = ->
        .pug.switch-account.h1
            span.name.pug(on-click=open-account) #{account-name}
            span.pug.icon(on-click=edit-account-name)
                icon "Pencil", 20
    edit-account-template = ->
        .pug.switch-account.h1
            input.h1.pug(value="#{store.current.edit-account-name}" on-change=edit-account style=input)
            span.pug.icon(on-click=done-edit)
                icon "Check", 20
            span.pug.icon(on-click=cancel-edit-account-name)
                icon "X", 20
    chosen-account-template =
        if store.current.edit-account-name is "" then view-account-template! else edit-account-template!  
    .pug(key="wallets" style=row)
        .pug(style=left-side)
            menu { store, web3t }
            manage-account { store, web3t }
            token-migration { store, web3t }
            add-coin-page { store, web3t }
            .wallets.pug(key="wallets-body")
                .header.pug(style=header-style)
                    span.pug.head.left.h1(style=header-left) #{lang.your-wallets}
                    chosen-account-template
                    your-account store, web3t
                .wallet-container.pug(key="wallets-viewport" style=border-style)
                    wallets |> map wallet store, web3t, wallets
        .pug(style=right-side)
            history { store, web3t }
module.exports = mobile