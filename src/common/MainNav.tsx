import { Link, useLocation } from "react-router-dom";
import { useState, useEffect } from "react";
import "./MainNav.css"; // Importa el archivo CSS

function MainNav() {
    const [isLoggedIn, setIsLoggedIn] = useState<boolean>(!!localStorage.getItem("userId"));
    const location = useLocation();

    useEffect(() => {
        const handleStorageChange = () => {
            setIsLoggedIn(!!localStorage.getItem("userId"));
        };

        window.addEventListener("storage", handleStorageChange);
        return () => {
            window.removeEventListener("storage", handleStorageChange);
        };
    }, []);

    return (
        <nav className="navbar navbar-expand-lg sticky-top">
            <div className="container">
                <div className="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul className="navbar-nav me-auto mb-2 mb-lg-0">
                        <li className={`nav-item ${location.pathname === "/" ? "active" : ""}`}>
                            <Link className="nav-link" to="/">Home</Link>
                        </li>
                        {isLoggedIn && (
                            <>
                                <li className={`nav-item ${location.pathname === "/ShootHormigas" ? "active" : ""}`}>
                                    <Link className="nav-link" to="/ShootHormigas">ShootHormigas</Link>
                                </li>
                                <li className={`nav-item ${location.pathname === "/PokemonCard" ? "active" : ""}`}>
                                    <Link className="nav-link" to="/PokemonCard">PokemonCard</Link>
                                </li>
                                <li className={`nav-item ${location.pathname === "/FreezerClick" ? "active" : ""}`}>
                                    <Link className="nav-link" to="/FreezerClick">FreezerClick</Link>
                                </li>
                                <li className={`nav-item ${location.pathname === "/BogerHungry" ? "active" : ""}`}>
                                    <Link className="nav-link" to="/BogerHungry">BogerHungry</Link>
                                </li>
                                <li className={`nav-item ${location.pathname === "/RexGame" ? "active" : ""}`}>
                                    <Link className="nav-link" to="/RexGame">RexGame</Link>
                                </li>
                            </>
                        )}
                        <li className={`nav-item ${location.pathname === "/Account" ? "active" : ""}`}>
                            <Link className="nav-link" to="/Account">Account</Link>
                        </li>
                        {!isLoggedIn && (
                            <>
                                <li className={`nav-item ${location.pathname === "/Login" ? "active" : ""}`}>
                                    <Link className="nav-link" to="/Login">Login</Link>
                                </li>
                                <li className={`nav-item ${location.pathname === "/Register" ? "active" : ""}`}>
                                    <Link className="nav-link" to="/Register">Register</Link>
                                </li>
                            </>
                        )}
                    </ul>
                </div>
            </div>
        </nav>
    );
}

export default MainNav;