import React from "react";
import ReactDOM from "react-dom/server";
import App from "../client/components/App.jsx";

export default function renderer(html) {
  console.log(html);
  const serverHtml = ReactDOM.renderToString(<App />);
  const regex = /(<div id="reviews">)(<\/div>)/;
  html = html.replace(regex, function(original, div1, div2) {
      return div1 + serverHtml + div2;
  });
  return html;
}