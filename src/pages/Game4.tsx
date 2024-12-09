import { Unity, useUnityContext } from "react-unity-webgl";
import { useEffect } from "react";
import "./styles.css"; // Asegúrate de importar el archivo CSS

function Game4() {
    const { unityProvider, sendMessage, isLoaded, unload } = useUnityContext({
        loaderUrl: "/BogerHungry.loader.js",
        dataUrl: "/BogerHungry.data.unityweb",
        frameworkUrl: "/BogerHungry.framework.js.unityweb",
        codeUrl: "/BogerHungry.wasm.unityweb",
    });

    function handleRestartGame() {
        sendMessage("GameManager", "ResetGame");
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
                    <h1 className="centered-title">BogerHungry</h1>
                    <Unity unityProvider={unityProvider} className="centered-unity" />
                    <div className="centered-content">
                        <button className="button" onClick={handleRestartGame}>Restart</button>
                    </div>
                </div>
            </div>
        </>
    );
}

export default Game4;