using KSP.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace KSP.Controllers
{
    [ApiController]
    [Route("api/Beneficiario")]
    public class BeneficiarioController : ControllerBase 
    {
        private readonly KspExamenContext context;

        public BeneficiarioController(KspExamenContext context)
        {
            this.context = context;
        }

        [HttpGet]
        public async Task<ActionResult<List<Beneficiario>>> Get( int id)
        {
            return await context.Beneficiarios.Where(x=>x.EmpleadoId == id).ToListAsync();
        }



        //Agregar
        [HttpPost]
        [Route("Add")]
        public async Task<ActionResult>Agregar (Beneficiario ben)
        {
            context.Add(ben);
            await context.SaveChangesAsync();   
            return Ok();
        }


        //Actualizar
        [HttpPost]
        [Route("Update")]
        public async Task<ActionResult> Post(Beneficiario ben)
        {
            var existe = await context.Beneficiarios.AnyAsync(x=>x.Id == ben.Id);

            if (!existe)
            {
                return NotFound();  
            }

            context.Beneficiarios.Update(ben);
            await context.SaveChangesAsync();
            return Ok();
        }

        

    }
}
