var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();

builder.Services.AddCors(opt => opt.AddPolicy(name: "AllowWebApp",
                        builder => builder.AllowAnyOrigin()
                                    .AllowAnyMethod().
                                    AllowAnyHeader()));

var app = builder.Build();

// Configure the HTTP request pipeline.
app.UseCors("AllowWebApp");
app.UseAuthorization();

app.MapControllers();

app.Run();
