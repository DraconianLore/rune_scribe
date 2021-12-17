import React from "react";
import { BrowserRouter as Router, Route, Routes } from "react-router-dom";
import Home from "../components/Home";
import Settings from "../components/Settings";

export default (
  <Router>
    <Routes>
      <Route path="/app" element={<Home />} />
      <Route path="/app/settings" element={<Settings />} />
    </Routes>
  </Router>
);

