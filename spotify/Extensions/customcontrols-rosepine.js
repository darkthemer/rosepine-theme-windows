// NAME: Custom Controls
// AUTHORS: darkthemer, OhItsTom
// DESCRIPTION: Replaces the original buttons with custom minimum, maximum, and close buttons from the titlebar.

(async function customControls() {
    if (!Spicetify.CosmosAsync) {
        setTimeout(customControls, 10);
        return;
    }

    await Spicetify.CosmosAsync.post("sp://messages/v1/container/control", {
        type: "update_titlebar",
        height: "1px",
    });

    const titlebar = document.createElement("div");
    titlebar.id = "customControls";
    titlebar.innerHTML = `
    <div class="ctrls">
        <div class="ctrl min"><div class="icon"></div></div>
        <div class="ctrl max"><div class="icon"></div></div>
        <div class="ctrl close"><div class="icon"></div></div>
    </div>
    `;
    document.getElementById("main").appendChild(titlebar);

    const style = document.createElement("style");
    style.id = "customControls_style";
    style.innerHTML = `
    :root {
        --control-button-width: 60px;
        --control-button-height: 45px;
    }
    .spotify__container--is-desktop:not(.fullscreen).spotify__os--is-windows .body-drag-top {
        right: calc(var(--control-button-width) * 3);
    }
    .ctrls {
        display: flex;
        flex-direction: row;
        position: absolute;
        top: 0;
        right: 0;
        width: auto;
        height: auto;
        z-index: 1;
    }
    .ctrl {
        display: flex;
        justify-content: center;
        align-items: center;
        width: var(--control-button-width);
        height: var(--control-button-height);
        background-color: transparent;
    }
    .icon {
        display: flex;
        justify-content: center;
        align-items: center;
        border-radius: 100%;
        background: var(--caption-color, currentColor);
        height: 18px;
        width: 18px;
    }
    .min {
        --caption-color: rgb(246, 193, 119);
        --caption-color-hover: rgba(246, 193, 119, 0.3);
    }
    .max {
        --caption-color: rgb(156, 207, 216);
        --caption-color-hover: rgb(156, 207, 216, 0.3);
    }
    .close {
        --caption-color: rgb(235, 188, 186);
        --caption-color-hover: rgba(235, 188, 186, 0.3);
    }
    .ctrl:hover .icon {
        background: var(--caption-color-hover, currentColor) !important;
        outline: 3px solid var(--caption-color, currentColor);
        outline-offset: -2px;
    }
    .icon::before {
        font-family: "Segoe Fluent Icons" !important;
        font-weight: bold;
        scale: 0.6;
        -webkit-text-stroke: 2px;
        color: var(--caption-color, currentColor);
    }
    .min:hover .icon::before {
        content: "\\f7af";
        position: absolute;
        rotate: -30deg;
    }
    .max:hover .icon::before {
        content: "\\ea3a";
        position: absolute;
    }
    .close:hover .icon::before {
        content: "\\e711";
        position: absolute;
    }
    `;
    document.head.appendChild(style);

    const min = titlebar.querySelector(".min");
    min.onclick = function () {
        alert(
            "[customControls extension]\nMinimizing the window is not possible due to limitations.\n\nPress Win+Down to minimize."
        );
    };

    const max = titlebar.querySelector(".max");
    max.onclick = function () {
        // if (!document.fullscreenElement) {
        //     document.documentElement.requestFullscreen();
        // } else if (document.exitFullscreen) {
        //     document.exitFullscreen();
        // }

        if (
            window.outerHeight < screen.availHeight ||
            window.outerWidth < screen.availWidth
        ) {
            localStorage.setItem("prevWinW", window.outerWidth);
            localStorage.setItem("prevWinH", window.outerHeight);
            localStorage.setItem("prevWinX", window.screenX);
            localStorage.setItem("prevWinY", window.screenY);
            window.moveTo(0, 0);
            window.resizeTo(screen.availWidth, screen.availHeight);
        } else if (
            window.outerHeight == screen.availHeight ||
            window.outerWidth == screen.availWidth
        ) {
            var prevWidth = localStorage.getItem("prevWinW");
            var prevHeight = localStorage.getItem("prevWinH");
            var prevX = localStorage.getItem("prevWinX");
            var prevY = localStorage.getItem("prevWinY");
            window.resizeTo(prevWidth, prevHeight);
            window.moveTo(prevX, prevY);
        }
    };

    const close = titlebar.querySelector(".close");
    close.onclick = function () {
        window.close();
    };
})();
