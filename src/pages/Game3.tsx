import {Unity, useUnityContext} from "react-unity-webgl";
import { useEffect } from "react";
import "./styles.css"; // Asegúrate de importar el archivo CSS

function Game3() {
    const { unityProvider, sendMessage, isLoaded, unload  } = useUnityContext({
        loaderUrl: "/FreezerClick.loader.js",
        dataUrl: "/FreezerClick.data.unityweb",
        frameworkUrl: "/FreezerClick.framework.js.unityweb",
        codeUrl: "/FreezerClick.wasm.unityweb",
    });

    function handleRestartGame() {
        sendMessage("GameManager", "RestartGame");
    }

    function handleSaveScore() {
        sendMessage("GameManager", "RegisterScore");
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
                    <h1 className="centered-title">FreezerClick</h1>
                    <Unity unityProvider={unityProvider} className="centered-unity" />
                    <div className="centered-content">
                        <button className="button" onClick={handleSaveScore}> Save Score</button>
                    </div>
                    <div className="centered-content">
                        <button className="button" onClick={handleRestartGame}> Restart</button>
                    </div>
                </div>
            </div>
        </>
    );
}

export default Game3;