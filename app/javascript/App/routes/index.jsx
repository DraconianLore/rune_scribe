import React from "react";
import { BrowserRouter as Router, Route, Routes } from "react-router-dom";
import Home from "../components/Home";
import UserDetails from "../components/UserDetails"

export default (
  <Router>
    <Routes>
      <Route path="/app" element={<Home />} />
      <Route path="/app/user" element={<UserDetails />} />
    </Routes>
  </Router>
);

