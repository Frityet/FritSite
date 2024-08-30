local html = require("xml-generator").xml

return {
    html.section {id="home", class="my-8"} {
        html.h1 {class="text-4xl font-bold mb-4"} "Welcome to My Personal Website";
        html.p {class="text-lg"} "This is where I showcase my skills, projects, and share a bit about myself.";
    };

    html.section {id="about", class="my-8"} {
        html.h2 {class="text-3xl font-bold mb-4"} "About Me";
        html.p {class="text-lg"} "I am a developer with a passion for creating awesome things on the web.";
    };

    html.section {id="projects", class="my-8"} {
        html.h2 {class="text-3xl font-bold mb-4"} "My Projects";
        html.p {class="text-lg"} "Check out some of the cool projects I've worked on.";
    };

    html.section {id="contact", class="my-8"} {
        html.h2 {class="text-3xl font-bold mb-4"} "Get In Touch";
        html.p {class="text-lg"} "Feel free to reach out if you want to connect.";
    };
}
