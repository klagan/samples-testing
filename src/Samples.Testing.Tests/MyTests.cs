using System;

namespace Samples.Testing.Tests
{
    using System.Collections.Generic;
    using System.Net.Http;
    using Microsoft.AspNetCore.Http;
    using Microsoft.AspNetCore.Http.Features;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.AspNetCore.Mvc.ViewFeatures;
    using Microsoft.Extensions.Logging;
    using Microsoft.Extensions.Primitives;
    using Moq;
    using WebApp.Controllers;
    using Xunit;
    
    // https://weblogs.asp.net/ricardoperes/unit-testing-the-httpcontext-in-controllers
    // https://dontcodetired.com/blog/post/Pretty-Method-Display-in-xUnitnet
    public class SampleTestFixture
    {
        [Fact]
        public void SampleTest()
        {
            // var testTempData = new Mock<ITempDataDictionary>();
            // testTempData
            //     .SetupSet(dictionary => dictionary["myTestItem"] = It.IsAny<object>())
            //     .Throws<Exception>();

            var logger = new Mock<ILogger<HomeController>>();
            
            var context = new DefaultHttpContext();
            
            var controller = new HomeController(logger.Object)
            {
                ControllerContext = new ControllerContext
                {
                    HttpContext = new DefaultHttpContext()
                }
            };

            var formContent = new Dictionary<string, StringValues>
            {
                {"kam", "k.lagan@email.com"}
            };
            var formCollection = new FormCollection(formContent);
            var formFeature = new FormFeature(formCollection);
            
            var queryContent = new Dictionary<string, StringValues>
            {
                {"first", "kam"},
                {"second", "lagan"}
            };
            
            var queryFeature = new QueryFeature(new QueryCollection(queryContent));
            
            controller.ControllerContext.HttpContext.Request.Headers["x-name"] = "kam";
            controller.ControllerContext.HttpContext.Features.Set<IFormFeature>(formFeature);
            controller.ControllerContext.HttpContext.Features.Set<IQueryFeature>(queryFeature);
            
            
            var result = controller.Index();

            var response = result as ViewResult;

            Assert.NotNull(response);
            Assert.Same("Index", response.ViewName);
            Assert.Same($"kam testing", controller.ViewData["Message"]);
        }
    }
}