import React from "react";
import ReactDOM from "react-dom/server";
import App from "../client/components/App.jsx";

export default function renderer(html, data) {
  const serverHtml = ReactDOM.renderToString(<App data={data} />);
  const regex = /(<div id="reviews">)(<\/div>)/;
  html = html.replace(regex, function(original, div1, div2) {
      return div1 + serverHtml + div2;
  });
  return html;
}