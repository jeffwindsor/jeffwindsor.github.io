<html lang="en">
<head>
  <!-— compatability tags -->
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">

  <!-— facebook open graph tags -->
  <meta property="og:title" content="{{ name }}" />
  <meta property="og:description" content="{{ personal-tagline }}" />
  <meta property="og:image" content="https://jeffwindsor.github.io/resources/avatar.png" />
  <meta property="og:url" content="https://jeffwindsor.github.io/" />
  <meta property="og:type" content="website" />

  <!-— twitter card tags additive with the og: tags -->
  <meta name="twitter:title" value="{{ name }}" />
  <meta name="twitter:description" value="{{ personal-tagline }}" />
  <meta name="twitter:image" content="https://jeffwindsor.github.io/resources/avatar.png" />
  <meta name="twitter:url" value="https://www.jeffwindsor.github.io/" />
  <meta name="twitter:card" content="summary_large_image">
  <meta name="twitter:domain" value="github.io" />

  <!-- fonts -->
  <link href=https://fonts.googleapis.com/css?family=Muli:300,400,600,700,800,900 rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Reem+Kufi|Roboto:300" rel="stylesheet">
  <!-- <link rel="stylesheet" href=https://use.fontawesome.com/releases/v5.0.13/css/all.css integrity=sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp
    crossorigin="anonymous"> -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
    integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
  
  <!-- stylesheets -->
  <link rel="stylesheet" type="text/css" href="./css/stitches.css">
  <!-- page styles -->
  <style>
    #landing-section{
      background: linear-gradient( rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5) ), url('./resources/trees2k2k.jpg') no-repeat center;
      color: #FAFAFA;
    }
    .intro {
      font-size: 3.75em;
      font-weight: 600;
    }
    .tagline {
      font-size: 1.5rem;
      margin: 1.5rem 0;
      font-weight: 100;
    }
  </style>

  <title>Jeff Windsor</title>
</head>

<body>
  
  <section 
    class="font-sans h-screen w-full bg-cover text-center flex flex-col items-center justify-center" 
    id="landing-section">
    <div class="intro">{{ name }}</div>
		<div class="tagline">{{ personal-tagline }} | {{ business-tagline }}</div>
  </section>
  <div class="icons-social">
    <a target="_blank" alt="github" href="https://github.com/jeffwindsor?tab=repositories"><i class="fab fa-github"></i></a>
    <a target="_blank" alt="stackoverflow" href="https://stackoverflow.com/story/jeffwindsor"><i class="fab fa-stack-overflow"></i></a>
    <a target="_blank" alt="linkedin" href="https://www.linkedin.com/in/jeffwindsor"><i class="fab fa-linkedin-in"></i></a>
    <a target="_blank" alt="twitter" href="https://twitter.com/jeffwindsor"><i class="fab fa-twitter"></i></a>
    <!-- <a target="_blank" alt="facebook" href="https://facebook.com/jeffwindsor1"><i class="fab fa-facebook-f"></i></a> -->
    <a target="_blank" alt="hackerrank" href="https://www.hackerrank.com/jeff_windsor"><i class="fab fa-hackerrank"></i></a>
    <br/>
    <a target="_blank" alt="resume-elegant" href="./resume/resume-elegant.html"><i class="far fa-address-card"></i></a>
    <!-- <a target="_blank" alt="resume-spartan" href="./resume/resume-spartan.html"><i class="fas fa-address-card"></i></a> -->
    <a target="_blank" alt="resume-stackoverflow" href="./resume/resume-stackoverflow.html"><i class="far fa-address-card"></i></a>
	</div>

  <section class="font-sans container m-auto flex flex-col py-8 max-w-xl text-center px-6">
    <h1 class="my-8 max-w-full m-auto text-3xl md:text-4xl lg:text-5xl font-medium">
      {{ personal-tagline }}
    </h1>
    <p class="mt-1 lg:mt-4 max-w-lg m-auto leading-loose mb-6 text-left">
      personal description
    </p>
    <h1 class="my-8 max-w-full m-auto text-3xl md:text-4xl lg:text-5xl font-medium">
      {{ business-tagline }}
    </h1>
    <p class="max-w-lg m-auto leading-loose mb-6 text-left">
      Highly motivated, passionate and strategically minded technologist with extensive experience with software development life cycle management, software languages, tools and technologies who has successfully managed, designed and developed a long line of customer facing products and strategic enterprise applications.
    </p>
  </section>
  
  <ul class="font-sans list-reset container m-auto text-grey-darkest"></ul>
  {% for item in site.highlights limit:5 %}
    <li><a href="{{ item.url }}">{{ item.title}}</a>
    <span class="postDate">{{ item.date | date: "%b %-d, %Y" }}</span>
    </li>
    <li class="inline-block border-b border-grey-light flex justify-between items-center py-4">
      <div class="flex items-start w-2/5">
        <div class="w-10 h-10 rounded mr-3">
          <div class="rounded-full h-10 w-10 bg-grey-light m-auto">A</div>
        </div>
        <div class="flex-1 overflow-hidden">
          <div>
            <span class="font-bold">{{ item.name }}</span>
            <span class="text-grey-dark text-xs">{{ item.company }}</span>
          </div>
          <p class="text-black leading-normal">{{ item.url }}</p>
        </div>
      </div>
      <p class="w-2/5">{{ item.description }}</p>
      <label for="status" class="font-bold w-1/5 text-right">{{ item.technologies }}</label>
    </li>
  {% endfor %}
  </ul>

  <ul class="font-sans list-reset container m-auto text-grey-darkest">

    <li class="inline-block border-b border-grey-light flex justify-between items-center py-4">
      <div class="flex items-start w-2/5">
        <div class="w-10 h-10 rounded mr-3">
          <div class="rounded-full h-10 w-10 bg-grey-light m-auto"></div>
        </div>
        <div class="flex-1 overflow-hidden">
          <div>
            <span class="font-bold">Sarah Mann</span>
            <span class="text-grey-dark text-xs">@sarah</span>
          </div>
          <p class="text-black leading-normal">1-324-111-0000</p>
        </div>
      </div>
      <p class="w-2/5">Web security expert at cloudflare</p>
      <label for="status" class="font-bold w-1/5 text-right">Inactive</label>
    </li>
    <li class="inline-block flex justify-between items-center py-4">
      <div class="flex items-start w-2/5">
        <div class="w-10 h-10 rounded mr-3">
          <div class="rounded-full h-10 w-10 bg-grey-light m-auto"></div>
        </div>
        <div class="flex-1 overflow-hidden">
          <div>
            <span class="font-bold">Kotlin Lee</span>
            <span class="text-grey-dark text-xs">@kotlin</span>
          </div>
          <p class="text-black leading-normal">1-332-435-1322</p>
        </div>
      </div>
      <p class="w-2/5">System admin at Drip.</p>
      <label for="status" class="font-bold w-1/5 text-right">Active</label>
    </li>
  </ul>


  <footer class="font-sans bg-black text-white py-8 px-4">
    <div class="mx-auto max-w-xl overflow-hidden flex justify-between items-center">
      <ul class="text-sm text-grey-dark list-reset flex items-center">
        <li> <a href="/" class="block mr-4 w-32">
            <img src="https://stitches-cdn.hyperyolo.com/logo-white.png" class="" alt="logo">
          </a></li>
        <li><a href="#" class="inline-block py-2 px-3 text-grey hover:text-grey-light no-underline">Product</a></li>
        <li><a href="#" class="inline-block py-2 px-3 text-grey hover:text-grey-light no-underline">Company</a></li>
        <li><a href="#" class="inline-block py-2 px-3 text-grey hover:text-grey-light no-underline">FAQs</a></li>
        <li><a href="#" class="inline-block py-2 px-3 text-grey hover:text-grey-light no-underline">About Us</a></li>
      </ul>
      <p class="inline-block py-2 px-3 text-grey-darker text-xs"> ©2018 Hyperyolo. All rights reserved.</p>
    </div>
  </footer>
</body>

</html>