require! {
    \react
    \../menu-funcs.ls 
    \../history-funcs.ls 
    \./naming.ls
    \../get-primary-info.ls
    \../get-lang.ls
    \./icon.ls
    \../navigate.ls
}
.settings-menu
    @import scheme
    position: relative
    display: block
    width: auto
    margin-left: 60px
    top: 0
    height: 100%
    min-height: 100vh
    padding-top: 5%
    box-sizing: border-box
    padding: 0px
    background: transparent
    @media(max-width:800px)
        width: 100%
        margin: 0
    >.title
        position: sticky
        z-index: 1
        background: linear-gradient(100deg, #331462 4%, #15063c 100%)
        box-sizing: border-box
        top: 0
        width: 100%
        color: gray
        font-size: 22px
        padding: 10px
        height: 60px
        >.header
            margin: 5px
            text-align: center
            @media(max-width:800px)
                text-align: center
        >.close
            position: absolute
            font-size: 20px
            left: 20px
            top: 13px
            cursor: pointer
            &:hover
                color: #CCC
    >.account-body
        overflow: hidden
        background: transparent
        width: 100%
        padding-bottom: 50px
        border-radius: $border
        position: relative
        box-sizing: border-box
        >.settings
            padding-top: 0px
            overflow-y: auto
            .title
                color: $primary
                text-transform: uppercase
                font-size: 12px
                letter-spacing: 2px
                opacity: .8
                font-weight: 400
                margin: 0
                a
                    color: #ee8791
            .box
                input
                    width: 104px
                .title
                    width: 100%
                    text-align: center
            input
                border-radius: $border
                height: 36px
                width: 40px
                line-height: 36px
                text-align: center
                font-size: 13px
            textarea
                border-radius: $border
            input, textarea
                outline: none
                margin-bottom: 3px
                border: 0px
                padding: 3px 10px
                box-sizing: border-box
            button
                background-color: $primary
                border: 1px solid $primary
                border-radius: $border
                color: white
                height: 36px
                width: 104px
                margin-top: 5px
                padding: 0 6px
                text-decoration: none
                text-transform: uppercase
                font-size: 10px
                font-weight: bold
                cursor: pointer
                outline: none
                display: inline-block
                text-overflow: ellipsis
                overflow: hidden
                white-space: nowrap
                &:hover
                    background: transparent
                    color: $primary
                &.link
                    min-width: 190px
            textarea
                width: 250px
                height: 72px
                resize: none
                font-size: 15px
            .switch-account
                color: #8e8e93
                font-size: 12px
                margin-top: 5px
                .bold
                    font-weight: bold
                .button
                    background: #8e8e93
                    width: 12px
                    height: 16px
                    display: inline-block
                    color: white
                    padding: 9px
                    border-radius: $border
                    cursor: pointer
                    vertical-align: top
                    &:hover
                        background: gray
                    &.left
                        border-radius: $border 0 0 $border
                    &.right
                        border-radius: 0 $border $border 0
                .mb-12
                    margin-bottom: 12px
        .bold
            color: #f0c16b
        .section
            border-bottom: 1px solid rgba(240, 237, 237, 0.16)
            .langs
                width: 80%
                @media(max-width: 800px)
                    width: 100%
                ul
                    list-style: none
                    display: inline-flex
                    width: 100%
                    margin: 0
                    padding: 0
                    margin-top: 20px
                    @media(max-width: 800px)
                        display: block
                        margin-top: 0
                    &:first-child
                        margin-top: 0px
            &.last
                border-bottom: 0
            &:first-child
                background: url("https://res.cloudinary.com/dfbhd7liw/image/upload/v1582209591/velas/logo-velas-opacity.png")
                background-repeat: no-repeat
                background-position: left 10px
            padding: 30px 20px
            display: flex
            @media (max-width: 800px)
                display: block
                padding: 20px
            .title
                padding: 0px
                width: 20%
                text-align: left
                .logo
                    display: none
                    @media (max-width: 800px)
                        display: block
                @media (max-width: 800px)
                    width: 100%
                    padding: 2px
                    text-align: center
            .description
                padding: 0px
                font-size: 13px
                color: #b0aeae
                width: 50%
                text-align: left
                @media (max-width: 800px)
                    width: 100%
                    padding: 7px
                    text-align: center
            .lang-item
                padding: 0px
                font-size: 13px
                color: #b0aeae
                width: calc(100%/6)
                text-align: left
                line-height: 20px
                cursor: pointer
                img
                    width: 20px
                    float: left
                    margin-right: 10px
                    &.active
                        opacity: 1
                    @media (max-width: 800px)
                        display: none
                @media (max-width: 800px)
                    width: 100%
                    padding: 7px 0
                    text-align: center
            .content
                width: 30%
                @media (max-width: 800px)
                    width: 100%
            .logo
                margin-bottom: 5px
                img
                    width: 30px
            .cap
                text-transform: capitalize
            .low
                text-transform: lowercase
            .link
                color: #6f6fe2
                text-decoration: underline
                cursor: pointer
            .pb-0
                padding-bottom: 0
        .change-index
            width: 80px
            padding: 1px
            border-radius: 0 !important
            text-align: center
switch-account = (store, web3t)->
    {  account-left, account-right, change-account-index } = menu-funcs store, web3t
    style = get-primary-info store
    input-style =
        background: style.app.wallet
        color: style.app.text
        border: "0"
    color =
        color: style.app.text
    button-primary2-style=
        border: "1px solid #{style.app.wallet}"
        color: style.app.text
        background: style.app.primary2
    .pug.switch-account(style=color)
        .pug.mb-12 Account Index:
        span.pug.button.left(on-click=account-left style=button-primary2-style)
            icon \ChevronLeft, 15
        span.pug.bold
            input.pug.change-index(value="#{store.current.account-index}" style=input-style on-change=change-account-index)
        span.pug.button.right(on-click=account-right style=button-primary2-style)
            icon \ChevronRight, 15
naming-part = ({ store, web3t })->
    .pug.section
        .pug.title #{lang.your-nickname ? 'Your Nickname'}
        .pug.description #{lang.your-nickname-info ? 'You are able to attach nickname, email or phone number to your account and share it with friends. They will use your nick to resolve your crypto-address'}
        .pug.content
            naming { store, web3t }
manage-account = (store, web3t)->
    { current, generate, enter-pin, check-pin, cancel-try, edit-seed, save-seed, change-seed, export-private-key } = menu-funcs store, web3t
    style = get-primary-info store
    lang = get-lang store
    input-style =
        background: style.app.wallet
        color: style.app.text
    color =
        color: style.app.text
    logo-style =
        filter: style.app.filterLogo
    button-primary2-style=
        border: "1px solid #{style.app.primary2}"
        color: style.app.text
        background: style.app.primary2
    button-primary3-style=
        border: "1px solid #{style.app.border}"
        color: style.app.text2
        background: style.app.primary3
    goto-terms = ->
        navigate store, web3t, \terms2
    set-lang = (lang)->
        return alert "lang is not available" if not store.langs[store.lang]?
        store.lang = lang
    change-lang-en = ->
        return set-lang \en 
    change-lang-ru = ->
        return set-lang \ru
    change-lang-ua = ->
        return set-lang \ua
    change-lang-cn = ->
        return set-lang \cn
    change-lang-kr = ->
        return set-lang \kr
    comming-soon =
        opacity: ".3"
        cursor: "no-drop"
    check = "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIGhlaWdodD0iNTEyIiB2aWV3Qm94PSIwIDAgNTEyIDUxMiIgd2lkdGg9IjUxMiIgY2xhc3M9IiI+PGc+PHBhdGggZD0ibTI1NiAwYy0xNDEuMTY0MDYyIDAtMjU2IDExNC44MzU5MzgtMjU2IDI1NnMxMTQuODM1OTM4IDI1NiAyNTYgMjU2IDI1Ni0xMTQuODM1OTM4IDI1Ni0yNTYtMTE0LjgzNTkzOC0yNTYtMjU2LTI1NnptMCAwIiBmaWxsPSIjMjE5NmYzIiBkYXRhLW9yaWdpbmFsPSIjMjE5NkYzIiBjbGFzcz0iYWN0aXZlLXBhdGgiIHN0eWxlPSJmaWxsOiMzQ0Q1QUYiIGRhdGEtb2xkX2NvbG9yPSIjMjE5NmYzIj48L3BhdGg+PHBhdGggZD0ibTM4NS43NSAyMDEuNzUtMTM4LjY2Nzk2OSAxMzguNjY0MDYyYy00LjE2MDE1NiA0LjE2MDE1Ny05LjYyMTA5MyA2LjI1MzkwNy0xNS4wODIwMzEgNi4yNTM5MDdzLTEwLjkyMTg3NS0yLjA5Mzc1LTE1LjA4MjAzMS02LjI1MzkwN2wtNjkuMzMyMDMxLTY5LjMzMjAzMWMtOC4zNDM3NS04LjMzOTg0My04LjM0Mzc1LTIxLjgyNDIxOSAwLTMwLjE2NDA2MiA4LjMzOTg0My04LjM0Mzc1IDIxLjgyMDMxMi04LjM0Mzc1IDMwLjE2NDA2MiAwbDU0LjI1IDU0LjI1IDEyMy41ODU5MzgtMTIzLjU4MjAzMWM4LjMzOTg0My04LjM0Mzc1IDIxLjgyMDMxMi04LjM0Mzc1IDMwLjE2NDA2MiAwIDguMzM5ODQ0IDguMzM5ODQzIDguMzM5ODQ0IDIxLjgyMDMxMiAwIDMwLjE2NDA2MnptMCAwIiBmaWxsPSIjZmFmYWZhIiBkYXRhLW9yaWdpbmFsPSIjRkFGQUZBIiBjbGFzcz0iIiBzdHlsZT0iZmlsbDojRkZGRkZGIiBkYXRhLW9sZF9jb2xvcj0iI2ZhZmFmYSI+PC9wYXRoPjwvZz4gPC9zdmc+"
    langs =
        gr: "data:image/png;base64,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"
        fr: "data:image/png;base64,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"
        en: "data:image/png;base64,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"
        cn: "data:image/png;base64,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"
        kr: "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAFMAAABTCAYAAADjsjsAAAAAAXNSR0IArs4c6QAAAERlWElmTU0AKgAAAAgAAYdpAAQAAAABAAAAGgAAAAAAA6ABAAMAAAABAAEAAKACAAQAAAABAAAAU6ADAAQAAAABAAAAUwAAAAAl2m0bAAAUvklEQVR4Ae1dCXSURba+3dlDgIQ1BAgBlACyyCKE8IYlICIjKgruIIiCO4pHFH2CorwRwaMMHkXPgIxE3zt4fIog4jAIM2AgLIGADCQcICxBlkDITmer932V7rYTevm7Q0iHefecSv9df9Wte7//3qr6q251TFLPpJQKgQi9keIdUhyumyA1RopACkcqRipEKkDKR8pCynBI6SaTyYLv9Uama90ywDOjzQFISdaUiM8wpNpSCRikIP1sTTsAbmVtmfplfYDYDem/kE4gXQtiO2yvm18C4q1QUMSMNB4pFak+ie1TDnpFwyIIHYg0Cekgkj8R5aFcgQ0CUQg6DOlfSP5MlG+Y3wIK4aKRkv0ZQSeyUd5ovwIVAo1DynUibEPIotzj6h1QCBGMtLghIGZARuoRXBtQfZ5nouEYNLwaqX9tBPCzursgz12Yn572RS6fwASQXdDYT0hxvjTq53WyIN9tADTTWzm9nncBSFriVqQ4bxtrIOWp11arnl6J7JVlWhvYhBb4vny9E9cBhsNC6fqGyLBlWl17HbhGlJeXy549e2TatGmSnp5uqCF/L7Rv3z6tT1pamlA/6om0zqr31RMfDGOQjiFpOnv2rBozZozCU1Pt2rVTq1atst1qkJ9ff/211oP63H777Yr6OdAxXHOw9UgeLROMOF3gqB1HboWFhbJy5UpZt45GKhIUFCRxcXFy6NAh2bXLsEfouvX959dff9Vyd+jQQYKDq2ZFP/74o9aPelopDp+rrTjY8nz7BBP7PLKsrEz98ssvqkWLFgrcVFRUlPrkk0/Ub7/9phISElTLli3Vu+++q/Ly8lDNf6mgoEB9+umn6oYbblADBw7U8i9dulTrQ72oH/Wkvg602DcErbXAaJwDM93oyJEjNZAhISHqvvvu08C9/vrrOo9u0rVrV3XixAlVVFTkWNVvrktKSlR2drZKSkpSAQEBWm7KTwO4//77FfUioNTz9OnTNeUe5xOg4MJ3bfsrIp/m/Pnz7aDFx8ergwcPqg0bNqhGjRrp/ObNmyv2P1lZWWr48OHqww8/9BsrJViLFy9Wo0ePVtu3b1fophR1IHCUn3pQH+bRKJj/zjvvqPz8fEdAiYf37/KoZF+0qKioUJs3b7a7QbNmzdSyZcv0k+vfv79uODw8XE2fPl1dvHhRPfnkk3ZwX331VYXR0VGga37N9mfPnq34sAnSgw8+qI4cOaLeeOMNRbmZRz1oicuXL1fUj3kdO3bUAFdWVjrKnIx7xgk1uYxmp0uXLqmhQ4fqBkJDQ9XDDz+smPfyyy/rPLpLnz59tHtzZEdnrvN79OihH4KdUT1e0BgoD1BQGDTVkiVLNKCU2+bu1Id6PfLII9rNU1JSFAaimn0ntRhmCE0UDESyr0daLBa1YMECLYTZbFbdu3dXmZmZ2k3CwsJ0Pjvs7777TgvXpUsXnRcREaEWLlzIhv2GFi1apNq0aaPlwwxEbdmyRcttG1Cpz5o1a1ROTo66fPmywpxTT5Xo7jUGVeLjeYEZhbgSrYnunZqaqpo2baoFoPknJyerkydPqt69e+s89jfPPvusunDhgnrsscd0XmBgoBoyZIh+yjZe/vBJq+MgYzOC8ePHa7kpv63fp17Hjx9XeBlRmDJpfZo0aaI2btyoSktLHdWY5NY6UZJ7NvatBvZ/BIWuQQEmT56scnNz1YwZM3Qe3WPAgAHq1KlT6ssvv1QEkWVjYmJq5d6VmJKU5VxQxRmHVf7ONJWXkqoKdqSp4kOZqux8jqosrTZlcVTQ4zWN4+abb9aDDOVnH0nwqIfN3akfrfPRRx+1Az9o0CDdjTk0QJxcz9Nxk5tOmmjmb7/9tgaHo1uvXr3U0aNH1erVq+3Th1atWqkffvhBZWRkqE6dOumyjRs3VnPmzLGxMfxZiadedOiwOrPsC5UxcbpKHzpGpfX5g9rdI0Ht6j5A7bppoP7O/EOPPKFOLVqi8lN3qvKCQsNt2ApyltG2bVst79SpU/WguXbtWkV9aAycHlFP6ku92b0x/7XXXqvp7uOR75zQmN5FpHuzPyEwKKmfDgcWTnnYZzKPbjFz5kztJhyQmMeOnVOiGv2LTQennxWY9+Wn7FBHXnhFpQ1IUju79FW7ut4C8BLU7l6J1VPPQWoXwe12iy63G2BnTJqucr5dq8ou2mdxTttxzOR054UXXtB9OgcYjgF04Zdeesnu7tST+lJv2yyA4wDekBzdPdUpkmism61Bui3N3gbQQw89pJ/eU089pfPozjR7vvmsWLHC7h58T9+6latXBggPrORYlsp6Y75K6zdE7Yrvr4G6AsCagDp830VwASzrZE6bofmpimrTGJeCcLrDh87pUXR0tNaD+lAvW3dFfdnVYUHHPoXq27ev9kQHxvZ9eUefn0iUYZVy7NgxgYkL3Fsw6glGc0EHLJhb6geB0U/mzZsn6D8FLq3roJMWzC9l8ODBuoy7P8pikbwt2+Toi69Jzqr/lUpLqZhCgsVkdhTHHYeqe5TPhLUBKCb5W1I0P/Ilf0/EunBtwRRJzpw5o/WgPm+99ZZQPxL1pd54QxJM5gV9qqB/1dgQJytp3HgdwD8QhlosR2qK/kFgYXLHHXcInooGqHPnzjJx4kQ5d+6cwNT1UtW9994rmJcJ5mJ6sQMDlbz//vuC/oYsXVJlcbHkbtgsJ+cvFMuJU1UgQrHakAYVipadPS8FqTslqHUrCW3fTgPtji8m5YJ3cMHrrzaM8+fPy+OPPy7FkHHv3r2CV0+9xPjAAw8IpnxaT4JPg4H12ljHvfnmm4vxEJTWAmAm4M42213HTwxEMnfuXHnvvfc0g8TEREE/It9//73gjUdbBaYQOg9dg2PVK64rwSvv5y1y8k/vS9mFix6VvYKBgQzMsCWoeTNpN3umRCYNEXNoqNtaO3bsEKwxaIvjQ8ECiNx55506j4bCtc3nn39eW2xkZKQrXoNQd7vNr5JcleLSFK3yrrvuEkx5NFNaKN2B7oU5qDz99NPiCUj0BVKUfkCylyytMyCpA92eD+r0n5fq9tTv7uhURcpN+akH9YGVaQ+kftR37Nixgjci7ZFOGVRlavxslvl35I1wU1gw2um1v9atW8uUKVOE634E+tZbb9VWiXdcd9XFcvyknFjwoeRv/IeYQt13BW4ZGbypLlukyYihEjtrhoTExbqtRbemdWKxQ+uJBWL5/PPPBYvEglUw+1qnGyYbYZkjOUmnZgzrc0sErmfPnoI1PsG0SJfFKCiYi4onIMvyC+XMP7bpQYcDzbUgtlOAQSnvnylSUcCQTtdE+akHXjV1IepH46G+1NsAJRJHE/6wo3M+X3LBBWuV8u2332pgaaXuiHOpcwePyr/mLJDIA3s4GXVX/KreY/8Z1r2bxM2bLeHdu3rkTWvkzsG4cePsBuOx0u8FBnJIiv/9u7ErPjn2I0aooLBUDuzLkqLDx6RZYIDYJxRGKteyDPvPyxmZUrR3v4TEtpeAiCqPcsXWk2G4qmfNj+cA5DWYHphWu33hUpGk7jwqoaWXBS/E1e5djS/k6I6rKiuXvG07pByDUh1T3YKJlxE5fbFE9h+5IMEB7lQ2ria5BMG+Q1SFBKpKqQSU7EqCrXlm/c2BH7yh5GAmRvgLIpCnDimebh5XVw2UWCokMztfjuZXSlkA+kpViqZ8A5W1AgBeiSlI9gRHyy8hsZIR1FxyzWESCCBjygtl+OWjMrD0tERVlEgFvEChLb5V0SotJ7MlvFtXMYe5n3fWAos4gslTDXVCJZZyyTpbLBfKQ+RMYIS0Li2SSh+wrLI2k+wFiMkRvSUFQBaZbdMrngEwyT4MuuvDu0i30nMyuWiPDCvJ0tZaCVAr8XppyT4jfGmoQzCbsM/k8ZA6IUtZhZzPs0iuKUx2B7eByt67GetUiFn+FtpJ3okcJhvCbpAiE2xAIepCJ4AJl7elg0Gt5M3IJFkZcbMUmIJRE23CvcvxaozlnjrR08q0cZ2CWV6hpKikFK4YIv8M7SDHA5tKEFzVKNGIMRGGS7eXFY37yuHA5lWguX0oFVICx/8sop/8EBYvxegWzOhZK/GejRUlo037Uk6DGeZLTeN14GZAJTOopSQ36i0WcwBWV4wpFQiLywxuId806i4HA7mSY3RiVSmlsN7kxr3kYFALKWffaVxgX0uG0TKLfa3tqV4gRvBGoXRJhNWYg2R92I3yaUR/sUDRYLqmC6Jr8v5hDDB/ieiLPrI9SnrbRVRItrmpbA2Nk0JTqARg4DEFUN06o2IOQAyqqZN+MyQoQFpHYfTk/BLueikgRL6CdZ6Au08p2CPdy89bpzeEj2Mv3BqfBeZg2RDaGZbcS/YHt7Le8RbMKtDYV48JDpduUVFiMvZqWFXR+7+FBJMvrlUvpd4zcFsjHFYZ2zpCAoLMgu4TpKQYU5W/hd4o20PaykBLtiQgdSjLxXm/cgwsQXIsKEp+ApCHglvDZSgeuwTfgGS9bHOE5IZGSkDbGAmo2wWWAkrLQ511QmHBAdI5polENwuV7PM42siJu8alQvIxKG0I6wILvBFtc7wGbLpjg0h6kGJBY32ra+GVlGDdu7RltAThddLkYeHaNR9Dd/KpQ5ahoj4UMptNADJc+nVqBrxqAEOsOLWxDir6rj2vNtZYXVATFjsi4rtIYAvMBLzcFqnOyeO3LIKZ4bFYLQqwzxzRN0bMddv5u5DQJJGBldI+oaeENnO5Su6irtfZGT6BySU4RHboBVRPTTZtFCyDe7SWXp2gTFkN6/RUubb38dLQq3Nzadc7XgIj3C9esykuwTGQl/r5QN6ByWV9bAMLIjv0VgaX+Bnb7ok6xTSWiSM7w8tsfaanGlfhProM7LHJnbfdJG1iosBQd8guGVMPblVMmjRJ64cQIL2N4bLClTc0mOnI58F3t8SV5/379+vFU9uT4xYp9p31bp67ylERIfLHQbEyuj9Cw2Et14TQzuj+bWXEwDhpgvbdEbctqAf2zXUx6scVdupLvQ0Q8Us3Y++Cm8wpripgs14Y+809Em4uISBU76MjvEQ3hKAD+eijj1xVt+d3btNYZk7oIbTSOnd3dCed27K9m6QT2vVElJ96EDhuojFOgHpSXwR3yc6dO20nMFyxSiGO7DNJP1d9XPmXDbAfQeyNIBhUb/tyU43bv2AgiIqQjz/+WLhl6o4CMQAldG8lb0/pIy0jYSnlddR/gi/5z5vcRxK6tRK2644oN+WnHtSHXRdijrR+1Bchhnp8cDgw4Iydxs/WUjUwaY0HDhwQRNjqvZ4XX3xRb8JzD5nnZD744AO55557ZMKECZoxG2VkB0K1nTVkz+Or5djEDrJo2i0SzTej0qsMKPhFR4bKQvBnO3xpcEcEiO5N+UnUh3ohsEvrSX0ZfPDcc8/pyA5uebuwUo2f7pUxsBDULKT2DPvYtm2b3lRCzKUwmmPTpk2COHBBgJZ2Be5K0lrp6ogR1xERDI+ZNWuWDiUBH7fEReONadnyn8t2S/pRbCcEQmnbY3Vb08VNzk/LK6RnXJTMn9pXRvZrK2Eh7oEkp6+++kqeeeYZQdymxMbGyvr16/UAy0GI4wH7TYRK6piAu+++W3jwioEInMlwi5vhMqCTSHGw6kqtAi+Qkcw7LNCxY0dBiKAezRhb88orr8iIESNk6tSpLCKIXdSWiKMrOuaIdRBZJjj+ocNNdCE3f8JCAmTMwPbyP3OSZOqYGyUCr5tSigm8t4ZKEDHQcHgZ1S9GVs0dLn9MiDUEJGcmDAGi1XGLl7FT1IfdF/UjUV/qjYMRgrBJHVPF6BViYwWSxZKt+PG6isDcHgUH6/QYUsjAejzVWocUFpWUqQ07T6p75v5dNR27UsmwvygZsVzJrSuUjEK6rUZiPu+jXPjov6o/zFirlq87pM7lFkMFY8SQQga0MkzcFlLIeFRGEFMvIKJDJw2EFLJBexScDUv9iRs6PpMlXAW7MnadIXcMyWasN0PzeOSjtsGul0vL1d7MHPWnL/eoxOfWqJYT/lsFjQZwIwFc0jL9GXT7X1Ur5Cc+v0bNWpqqNu7OVnmFForrFTkLdiUDHs2hXtSPehoIdnUdbwB+9shhMncWhs2n+tlnn2nL5VP95ptvdBjz1QzDLi2rUL/lFKm9h3PUprRs9dOOE2rznmyVju9nkM/7vpKzMGyCRj2oD4N8qR9j9D2EYVOE8dWs0fELblaLaae71zwg8MUXX+hzPXhjUKNGjdJucT0cEKB7Y1BR1IvnhviJ/lG7vIsDAu5j2gksALWftiD0zo6uMIadRzzQCevGGsrRFfaR7o6uUB+6N+I0FY8Fujm6QmgmORqi02sUqnYOiLV45OP/D1URCTsZOwdktc5h9mq4oLtvNnDcj7Hf7Gcb8nE/HmP0cNyP0AxzaomuMlHBfnaStd0dROUpBPDRpxKu84OohELPx13h5jQflaqd6iUXnkb4Nz8i7dupXiIM/KqdN7+eD+/zRwj4YwRUmwOqk8P7tCffzpvbzBUM7L+EQG50dx7oZKN4jdLHiLHyoifuWARgkQZDWK/UclN+vnRQH+pF/ahnDVpsw8TnTzDkT5RVQ+l6/sET/pBLjR88IabU31A8tkegwajar8fQ3TkHe+KJJxTOy7CxBk88xUt9qFeN3+Y4BuWwReCZ3G+MONQHwy74uhWppUP29X55Hgr+B9w/04iihlcRrQzHgCnDaf4diHqOMQokATEMJguDMX+4aDgSn9j1TNRvuFVfw3oadnNHjlaX/wl5cY7518l1FvS4Nr9SSMCsps/juw3rJ7YovHuiPoOt+rkv6eSuV27uWB8NcheKgP7ZMb8BX1MPAlm1u1ZfisDt+aZk/KcIUNiPiHLX7s3magMPgfguX21xxI8AcyUK5fX+F7SuNniu+EE4Lt/ZfxfJlRb1nE/5hrnSwa/yISgXmLlib/9ZH1z7A1EeyuV5U92vEIUwEJp7Styks+964ro+iO1TDp8HXL/CFopwX57/BeUE0rUgtsP2nO9r1wE6Pk3aayMHlKN18Ix7kjUl4jMMqbZU7/8P6JqDWRMxgMvoFnf/qYoxgQSbYDEyjImHGrKQGEJuS/X+n6r+D9bjOKlKIcymAAAAAElFTkSuQmCC"
        jp: "data:image/png;base64,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"
        hn: "data:image/png;base64,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"
        sp: "data:image/png;base64,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"
        ua: "data:image/png;base64,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"
        ru: "data:image/png;base64,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"
        kz: "data:image/png;base64,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"
    input-style2 = { ...input-style, width: "85px" } 
    button-style2 = { ...button-primary2-style, width: "20px" }
    .pug
        .pug.section
            .pug.title(style=color) Language
            .pug.langs
                ul.pug
                    li.pug.lang-item(style=comming-soon)
                        | Deutsch
                        img.pug(src="#{langs.gr}")
                    li.pug.lang-item(style=comming-soon)
                        | Français
                        img.pug(src="#{langs.fr}")
                    li.pug.lang-item(on-click=change-lang-en style=color)
                        | English
                        img.pug(src="#{langs.en}")
                    li.pug.lang-item(on-click=change-lang-kr style=color)
                        | 한국어
                        img.pug(src="#{langs.cn}")
                    li.pug.lang-item(on-click=change-lang-cn style=color)
                        | 中文語言
                        img.pug(src="#{langs.kr}")
                    li.pug.lang-item(style=comming-soon)
                        | 日本語
                        img.pug(src="#{langs.jp}")
                ul.pug
                    li.pug.lang-item(style=comming-soon)
                        | हिंदी
                        img.pug(src="#{langs.hn}")
                    li.pug.lang-item(style=comming-soon)
                        | Español
                        img.pug(src="#{langs.sp}")
                    li.pug.lang-item(on-click=change-lang-ua style=color)
                        | Українська
                        img.pug(src="#{langs.ua}")
                    li.pug.lang-item(on-click=change-lang-ru style=color)
                        | Русский
                        img.pug(src="#{langs.ru}")
                    li.pug.lang-item(style=comming-soon)
                        | Қазақ
                        img.pug(src="#{langs.kz}")
        .pug.section
            .pug.title(style=color) #{lang.secret-phrase ? 'Secret Phrase'}
            .pug.description(style=color) #{lang.secret-phrase-warning ? 'You are responsible for keeping this phrase safe. In case of loss of this phrase, we will not be able to help you restore it.'}
            .pug.content
                switch
                    case current.try-edit-seed is yes
                        .pug.box
                            .pug
                                input.pug(on-change=enter-pin value="#{current.pin}" type="password" style=input-style2 placeholder="#{lang.enter-pin ? 'Enter PIN'}")
                                button.pug(on-click=check-pin style=button-style2) >
                            .pug    
                                button.pug(on-click=cancel-try style=button-primary2-style) #{lang.cancel}
                    case current.saved-seed is no
                        .pug.box
                            .pug.title 
                                span.pug #{lang.secret-phrase ? 'Secret Phrase'}
                                a.pug.generate(on-click=generate) (generate)
                            textarea.pug(on-change=change-seed value="#{current.seed}" style=input-style placeholder="#{lang.secret-phrase ? 'Secret Phrase'}")
                            .pug
                                button.pug(on-click=save-seed style=button-primary2-style) #{lang.save}
                    case current.saved-seed is yes
                        .pug
                            button.pug(on-click=edit-seed style=button-primary2-style) #{lang.edit-secret ? 'Edit Secret'}
        .pug.section
            .pug.title(style=color) #{lang.switch-account-index ? 'Switch Account Index'}
            .pug.description(style=color)
                span.pug.bold #{lang.for-advanced-users ? 'For advanced users only'}.
                span.pug #{lang.switch-account-info ? 'You could have a lot of unique addresses by switching account index. By default, you are given an index of 1, but you can change it in range 0 - 2,147,483,647'}
            .pug.content
                switch-account store, web3t
        .pug.section
            .pug.title(style=color) #{lang.export-private-key ? 'Export PRIVATE KEY'}
            .pug.description(style=color)
                span.pug.bold #{lang.for-advanced-users ? 'For advanced users only'}
                span.pug #{lang.export-private-key-warning ? 'Please never do it in case when you do not understand exact reason of this action and do not accept risks'}.
            .pug.content
                button.pug(on-click=export-private-key style=button-primary2-style) #{lang.show-secret ? 'Show Secret'}
        .pug.section
            .pug.title(style=color)
                .pug.logo
                    img.pug(src="#{style.branding.logo}" style=logo-style)
                span.pug Velas Wallet
                span.pug.bold.low #{store.version}
            .pug.description.pb-0(style=color)
                span.pug #{lang.about-wallet ? 'Multi-currency Wallet Managed by one mnemonic phrase'}.
                br.pug
                span.pug #{lang.pls-read ? 'Please read our'} 
                span.pug 
                    a.pug.link(href="https://velas.com/privacy.html" target="_blank") #{lang.privacy-policy ? 'Privacy Policy'}
                span.pug  & 
                span.pug.link(on-click=goto-terms) #{lang.terms-of-use ? 'Terms of Use'}
            .pug.content
module.exports = ({ store, web3t } )->
    go-back = ->
        navigate store, web3t, \wallets
    style = get-primary-info store
    account-body-style = 
        color: style.app.text
    border-style =
        color: style.app.text
        border-bottom: "1px solid #{style.app.border}"
    lang = get-lang store
    .pug.settings-menu
        .pug.title(style=border-style)
            .pug.header #{lang.manage-account}
            .pug.close(on-click=go-back)
                icon "ChevronLeft", 20
        .account-body.pug(style=account-body-style)
            .pug.settings
                manage-account store, web3t