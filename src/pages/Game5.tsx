import { Unity, useUnityContext } from "react-unity-webgl";
import { useEffect } from "react";
import "./styles.css"; // Asegúrate de importar el archivo CSS

function Game5() {
    const { unityProvider, sendMessage, isLoaded, unload } = useUnityContext({
        loaderUrl: "/RexGame.loader.js",
        dataUrl: "/RexGame.data.unityweb",
        frameworkUrl: "/RexGame.framework.js.unityweb",
        codeUrl: "/RexGame.wasm.unityweb",
    });

    function handleRestartGame() {
        sendMessage("GameManager", "RestartGame");
    }

    function sendUserId() {
        const userId = localStorage.getItem("userId");
        if (userId) {
            sendMessage("GameManager", "ReceiveUserId", userId);
        }
    }

    useEffect(() => {
        if (isLoaded) {
            sendUserId();
        }

        return () => {
            if (isLoaded) {
                unload();
            }
        };
    }, [isLoaded]);

    return (
        <>
            <div className="centered-container">
                <div className="centered-content">
                    <h1 className="centered-title">RexGame</h1>
                    <Unity unityProvider={unityProvider} className="centered-unity" />
                    <div className="centered-content">
                        <button className="button" onClick={handleRestartGame}>Restart</button>
                    </div>
                </div>
            </div>
        </>
    );
}

export default Game5;