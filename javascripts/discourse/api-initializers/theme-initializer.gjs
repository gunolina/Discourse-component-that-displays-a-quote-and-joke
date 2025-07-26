import { apiInitializer } from "discourse/lib/api";

export default apiInitializer((api) => {
 api.onPageChange((url) => {
  const homepagePaths = ["/", "/latest", "/top", "/categories", "/new"];
  const isHomepage = homepagePaths.some(path =>
    url === path || url.startsWith(path + "?")
  );

  const existing = document.getElementById("daily-widget-wrapper");
  if (!isHomepage) {
    if (existing) existing.remove();
    return;
  }

  if (existing) return;

  // Quotes
  const quotes = [
    { text: "Write your chosen quote here.", author: "And its author here" },
    { text: "If you need more quotes copy this line.", author: "Gunolina.com" },
  ];
  const quote = quotes[Math.floor(Math.random() * quotes.length)];

  // Jokes
const jokes = [
  {
    text: "Write your chosen joke here<br>— You can also use some HTML tags."
  },
  {
    text: "If you need more jokes, copy this line from "{" to "},"
  },
];
const joke = jokes[Math.floor(Math.random() * jokes.length)];

  // Wrapper
  const wrapper = document.createElement("div");
  wrapper.id = "daily-widget-wrapper";
  wrapper.className = "daily-widget-grid";

  const quoteDiv = document.createElement("div");
  quoteDiv.className = "quote-widget";
  quoteDiv.innerHTML = `
    <div class="quote-title"> Quote</div>
    <p>"${quote.text}"</p>
    <p style="text-align:right; margin-top: 0.5em;">— <em>${quote.author}</em></p>
  `;
  const jokeDiv = document.createElement("div");
jokeDiv.className = "joke-widget";
jokeDiv.innerHTML = `
  <div class="joke-title">🤣 Joke  </div>
  <div class="joke-text">${joke.text}</div>
`;


  wrapper.appendChild(quoteDiv);
wrapper.appendChild(jokeDiv);

  const target = document.querySelector(".list-container");
  if (target) {
    target.prepend(wrapper);
  }
});

});