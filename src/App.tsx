import { BrowserRouter, Route, Routes } from 'react-router-dom'
import './App.css'
import Home from "./pages/Home.tsx";
import MainHeader from "./common/MainHeader.tsx";
import MainNav from "./common/MainNav.tsx";
import MainFooter from "./common/MainFooter.tsx";
import Game from "./pages/Game.tsx";
import Game2 from "./pages/Game2.tsx";
import Game3 from "./pages/Game3.tsx";
import Game4 from "./pages/Game4.tsx";
import Game5 from "./pages/Game5.tsx";
import Login from "./pages/Login.tsx";
import Register from "./pages/Register.tsx";
import Account from "./pages/Account.tsx";
import Update from "./pages/Update.tsx";

function App() {
    return (
        <>
            <BrowserRouter>
                <MainHeader />
                <MainNav />
                <Routes>
                    <Route path='/' element={<Home/>}/>
                    <Route path='/ShootHormigas' element={<Game/>}/>
                    <Route path='/PokemonCard' element={<Game2/>}/>
                    <Route path='/FreezerClick' element={<Game3/>}/>
                    <Route path='/BogerHungry' element={<Game4/>}/>
                    <Route path='/RexGame' element={<Game5/>}/>
                    <Route path='/Login' element={<Login onLogin={() => {}} />} />
                    <Route path='/Register' element={<Register />} />
                    <Route path='/Account' element={<Account />} />
                    <Route path='/Update' element={<Update />} />
                </Routes>
                <MainFooter />
            </BrowserRouter>
        </>
    );
}

export default App