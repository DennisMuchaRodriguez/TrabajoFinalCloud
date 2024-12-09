import { Unity, useUnityContext } from "react-unity-webgl";
import { useEffect } from "react";
import "./styles.css"; // Asegúrate de importar el archivo CSS

function Game() {
    const { unityProvider, sendMessage, isLoaded, unload } = useUnityContext({
        loaderUrl: "/ShootHormigas.loader.js",
        dataUrl: "/ShootHormigas.data.unityweb",
        frameworkUrl: "/ShootHormigas.framework.js.unityweb",
        codeUrl: "/ShootHormigas.wasm.unityweb",
    });

    function handleRestartGame() {
        sendMessage("GameManager", "RestartGame");
    }
    function handlePause() {
        sendMessage("GameManager", "TogglePause");
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
                    <h1 className="centered-title">ShootHormigas</h1>
                    <Unity unityProvider={unityProvider} className="centered-unity" />
                    <div className="centered-content">
                        <button className="button" onClick={handleRestartGame}>Restart</button>
                    </div>
                    <div className="centered-content">
                        <button className="button" onClick={handlePause}>Pause</button>
                    </div>
                </div>
            </div>
        </>
    );
}

export default Game;